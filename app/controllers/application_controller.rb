
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
  
    @articles = Article.all 
  
    if @articles.empty?
      "Wait a minute, there aren't any articles!"
    else
      erb :index
      
    end
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
   # binding.pry
    erb :show
  end
  
  
  post '/articles' do
   # binding.pry
    article = Article.create(params)
    redirect "/articles/#{article[:id]}"
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    #binding.pry
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect '/articles'
    
  end
  
  
end
