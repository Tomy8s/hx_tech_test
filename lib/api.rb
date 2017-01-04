require 'sinatra/base'
require 'json'
require_relative 'user.rb'
require_relative 'users.rb'

class SUPAAPI < Sinatra::Base
  get '/' do
    'SUPAAPI!'
  end

  get '/new' do
    Users.create(params)
    redirect '/get'
  end

  get '/get' do
    if params[:id]
      Users.return_user(params[:id].to_i)
    else
      Users.return_user
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
