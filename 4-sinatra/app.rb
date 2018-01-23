require 'bundler'

Bundler.require(:default)

require "sinatra"
require 'sinatra/reloader'
require 'fast_secure_compare/fast_secure_compare'

enable :sessions

get '/' do
  if session[:logged]
    redirect to '/login'
  else
    erb :form
  end
end

post '/login' do
  if session[:logged]
    erb :logged
  else
    pass_hash = [:salt, :pass, :timestamp].zip(File.open("password.txt").read.split(":")).to_h
    salt = pass_hash[:salt]
    pass = pass_hash[:pass]
    timestamp = pass_hash[:timestamp]

    hashed_password = Digest::SHA2.new(512).hexdigest(salt+"#"+params[:password]+"#"+timestamp)
    if FastSecureCompare.compare(hashed_password, pass)
      session[:logged] = true
      erb :logged
    else
      redirect '/'
    end
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
