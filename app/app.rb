ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base


  get '/' do
    erb :index
  end

  get '/sign-up/new' do
    erb :sign_up
  end

  post '/sign-up' do
    @user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
