require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    $bookmarks = Bookmark.new
    @bookmarks_return = $bookmarks.bookmark_list
    erb :bookmarks
  end

  run! if app_file == $0
end
