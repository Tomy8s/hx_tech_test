require 'sinatra/base'
require 'json'
require_relative 'user.rb'
require_relative 'users.rb'

class SUPAAPI < Sinatra::Base
  get '/' do
    '<a href="https://github.com/Tomy8s/SUPAAPI">Read me</a>'
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

  get '/update' do
    if !params[:id]
      'please specify an id'
    else
      Users.update_user(params)
      redirect "/get?id=#{params[:id]}"
    end
  end

  get '/delete' do
    if !params[:id]
      'please specify an id'
    elsif Users.delete_user(params[:id].to_i)
      'deleted'
    else
      redirect "/get?id=#{params[:id]}"
    end
  end

  run! if app_file == $0
end
