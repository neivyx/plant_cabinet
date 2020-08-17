class UsersController < ApplicationController
  
    get "/login" do
        erb :login
      end
    
      post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          
          flash[:message] = "Welcome, #{@user.name}!"
          redirect "/users/#{@user.id}"
    
          
        else 
          flash[:error] = "Invalid Credentials"
          redirect '/login'
        end
    end

    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      erb :'/users/show.html'
    end

    get '/signup' do
        erb :signup
      end


      post '/users' do
        @user = User.new(params)
        if @user.save 
    
         session[:user_id] = @user.id
         flash[:message] = "Account Succesfully Created!, #{@user.name}! Welcome!"
         redirect "/users/#{@user.id}"
        else 
          flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
          redirect '/signup'
        end
      end

      get '/logout' do 
        session.clear
        redirect '/'
      end
  

end