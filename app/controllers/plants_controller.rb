class PlantsController < ApplicationController

  get '/plants' do
    @plants = Plant.all
    erb :"/plants/index.html"
  end
 #CREATE 
  get '/plants/new' do 
    redirect_if_not_logged_in
    erb :"/plants/new.html"
  end 
   
end