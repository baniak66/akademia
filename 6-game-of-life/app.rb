require 'bundler'

Bundler.require(:default)

require 'sinatra/reloader'
require 'haml'

get '/' do
  haml :start
end
