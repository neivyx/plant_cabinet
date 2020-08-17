class PlantsController < ApplicationController

  get '/plants' do
    @plants = Plant.all
    erb :"/plants/index.html"
  end
  
  get '/plants/new' do 
    redirect_if_not_logged_in
    erb :"/plants/new.html"
  end 


  post '/plants' do  
    redirect_if_not_logged_in
    if params[:name] != ""
      
      @plant = Plant.create(name: params[:name], user_id: current_user.id, location: params[:location], light_requirement: params[:light_requirment], watering: params[:watering], description: params[:description])
    
      redirect "/plants/#{@plant.id}"
    else 
    
      redirect '/plants/new.html'
    end 
  end

  get '/plants/:id' do 
    plant_list 
    erb :'/plants/show.html'
  end 

  get '/plants/:id/edit' do
    plant_list
    redirect_if_not_logged_in
    if authorized_to_edit?(@plant)
      erb :'/plants/edit.html'
    else 
       redirect "/users/#{current_user.id}"
    end 
  end 

   
end