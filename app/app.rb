
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
    link = Link.new(url: params[:url], title: params[:title])
    (params[:tag]).split(", ").map do |t|
      tag = Tag.first_or_create(name: t)
      link.tags << tag
    end
    link.save
    # tag  = Tag.first_or_create(name: params[:tag])
    # # tag  = Tag.first_or_create(name: params[:tag])
    # link.tags << tag
    # link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.links : []
    erb :links
  end

run! if app_file == $0

end
