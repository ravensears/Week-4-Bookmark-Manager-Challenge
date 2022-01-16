require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end
  
  get '/bookmarks' do
    p ENV

    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add" 
  end

  post '/bookmarks' do 
    #connection = PG.connect(dbname: 'Bookmarks_Manager')
    #connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end 

  run! if app_file == $0
end
