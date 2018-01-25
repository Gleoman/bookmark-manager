
ENV['RACK-ENV'] ||= 'development'

require_relative 'data_setup'
# require './app/model/link'
# require './app/model/tag'
require 'sinatra/base'
require 'pry'

class Bookmark < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links'do
    @bookmarks = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag  = Tag.first_or_create(name: params[:tag])
    link.tags << tag
    # binding.pry
    link.save
    redirect '/links'
  end

run! if app_file == $0

end
