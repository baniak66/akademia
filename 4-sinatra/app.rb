require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'

get '/' do
  "HELLO"
end
