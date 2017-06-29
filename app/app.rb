ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    "hello"
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/addlink'
  end

  get '/tags/:search' do
    tag = Tag.first(name: params[:search])
    @links = tag.links
    erb :'links/index'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each { |tag|
      link.tags << Tag.first_or_create(name: tag)
    }
    link.save
    redirect '/links'
  end

  get '/signup' do
    @user = User.new
    erb :'signup/index'
  end

  post '/signup' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'signup/index'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
