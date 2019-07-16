
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get ('/articles/new'){erb :new}
  
  post '/articles' do 
    Article.create(title: params[:title])
    erb :show
  end
  
  get '/articles' do 
    @articles = Article.all
    erb :index
  end
  
  
  get '/articles/:id' do 
    @article = params[:id]
    erb :show
  end

  get '/articles/:id/edit' do 
    erb :edit
  end
  
  get '/' do
  end
end
