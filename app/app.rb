ENV['RACK_ENV'] ||= 'development'
require 'sinatra'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
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

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

end
