require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #create
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    # @article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end

  #read #index
  get '/articles' do
    @articles = Article.all
    erb :index
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
    article = Article.find(params[:id])
    article.update(title: params[:title], content: params[:content])
    #@article.update(params[:article])
    redirect to "/articles/#{article.id}"
  end

  #delete
  delete '/articles/:id/delete' do
    # Article.destroy(params[:id])
    Article.find(params[:id]).destroy
    redirect to '/articles'
  end

end
