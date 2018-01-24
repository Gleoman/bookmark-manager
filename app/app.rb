
ENV["RACK-ENV"] ||= "development"

require './app/model/link'
require 'sinatra/base'
# require 'data_mapper'

class Bookmark < Sinatra::Base

  get '/links'do
    @bookmarks = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

run! if app_file == $0

end
