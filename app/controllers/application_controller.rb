
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get ('articles/new'){erb :new}
  
  post '/articles' do 
    
  erb :show
    
  end
  
  
  get ('articles/:id'){}

  get '/' do
  end
end
