require 'sinatra/base'
require 'json'
require_relative 'user.rb'

class SUPAAPI < Sinatra::Base
  get '/' do
    'SUPAAPI!'
  end

  get '/new' do
    $user = User.new(params)
    redirect '/get'
  end

  get '/get' do
    $user.display_json
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
