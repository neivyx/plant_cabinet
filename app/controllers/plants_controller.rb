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
      flash[:message] = "Plant successfully created." if @plant.id

      redirect "/plants/#{@plant.id}"
    else 
      flash[:errors] = "Please provide information in the appropriate fields"
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

  patch '/plants/:id' do
     redirect_if_not_logged_in
     plant_list 
       if params[:name] != "" || params[:location] != "" || params[:watering] != "" || params[:description] != ""
        @plant.update(name: params[:name], description: params[:description], location: params[:location], watering: params[:watering], light_requirement: params[:light_requirement])
      
        redirect "/plants/#{@plant.id}" 
        flash[:message] = "Plant successfully updated!"

     else 
      flash[:error] = "Field can't be empty, please provide valid input!"
       redirect "/plants/#{@plant.id}/edit"
     end  
  end


  delete '/plants/:id' do 
    plant_list
    if authorized_to_edit?(@plant)  
      @plant.destroy
      redirect '/plants'
    else
      redirect '/plants'
    end 
  end    
end

private

def plant_list 
  @plant = Plant.find(params[:id])
  end 
end 
