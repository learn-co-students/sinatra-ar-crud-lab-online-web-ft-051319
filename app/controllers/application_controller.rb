
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
  
  get 'article/:id/edit' do
    erb :edit
  end
  
  patch 'article/:id' do
    @article = Article.find(params[:id])
    binding.pry
    @article.update(params[:id])
    redirect "article/#{article[:id]}"
  end
  
end
