require './config/environment'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "our_super_secret_session_secret"
    register Sinatra::Flash

  
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
      erb :welcome
    end 
  end 

  helpers do 

    def current_user
     @current_user ||= User.find_by(id:session[:user_id])
    end 

    def logged_in? 
      !!current_user
    end 

    def authorized_to_edit?(plant)
      plant.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end 

  end

 
end
