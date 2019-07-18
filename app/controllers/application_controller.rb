
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get ('/articles/new'){erb :new}
  
  post '/articles' do 
    @article = Article.create(title: params[:title], content: params[:content])
    @article.save
    redirect to '/articles/'+@article.id.to_s
  end
  
  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id].to_i)
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end
  
  get '/articles/:id' do 
    @article = Article.find(params[:id].to_i)
    erb :show
  end
  
  delete '/articles/:id' do 
    @article = Article.find(params[:id].to_i)
    
    erb:

  get '/' do
  end
end
