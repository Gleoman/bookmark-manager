
ENV['RACK-ENV'] ||= 'development'

require_relative 'data_setup'
require 'sinatra/base'
require 'pry'

class Bookmark < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
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
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @bookmarks = tag ? tag.links : []
    erb :links
  end

run! if app_file == $0

end
