
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id/edit' do
    #binding.pry
    idx=params[:id].to_i

    @article=Article.all[idx-1]
  #  binding.pry
    erb :edit
  end



  get '/articles/:id' do
  #      binding.pry
    idx=params[:id].to_i

    @article=Article.all[idx-1]
  #  binding.pry
    erb :show
  end

  get '/articles' do
    @articles=Article.all
    # binding.pry
    erb :index
  end

  get '/' do
  end



  post '/articles' do
    @title=params[:title]
    @content=params[:content]
#    binding.pry
    newart=Article.create ({:title => @title, :content => @content})
    @id=newart.id
    redirect to "/articles/#{@id}"
  end

  patch "/articles/:id" do

    articlenew= Article.find(params[:id])

    @title=params[:title]
    @content=params[:content]
    articlenew.update({:title => @title, :content => @content})
    redirect to "/articles/#{articlenew.id}"
  end

  delete "/articles/:id" do
    Article.find(params[:id]).delete
    redirect to "articles/"
  end







end
