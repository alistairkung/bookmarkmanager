require 'sinatra'

class Bookmark_manager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
end
