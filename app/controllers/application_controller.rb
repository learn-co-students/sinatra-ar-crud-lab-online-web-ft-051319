
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    # redirect "/articles"
  end

  #read
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #create
    get '/articles/new' do 
      erb :new
      #show form to create
    end

    post '/articles' do 
      @article = Article.create(params[:article])
      redirect "/articles/#{@article.id}"
    end

  #read
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  #update
    get '/articles/:id/edit' do 
      @article = Article.find(params[:id])
      erb :edit
      #show form with current attrs to update
    end

    patch '/articles/:id' do 
      @article = Article.find(params[:id])
      @article.update(params[:article])
      redirect "/articles/#{@article.id}"
    end

  #delete
  delete '/articles/:id' do 
    Article.destroy(params[:id])
    redirect "/articles"
  end

end
