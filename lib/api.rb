require 'sinatra/base'
require_relative 'user.rb'

class SUPAAPI < Sinatra::Base
  get '/' do
    'Hello SUPAAPI!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
