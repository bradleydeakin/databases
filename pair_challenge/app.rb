require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    
    @bookmarks_return = Bookmark.all
    p @bookmarks_return
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :new
  end

  post '/add_bookmark' do
    Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    p params
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end
  run! if app_file == $0
end
