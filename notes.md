//applications controller- enable sessions. This was the error we were getting yesterday. The app is not able to read 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "our_super_secret_session_secret"
    
  end


*************
welcome.erb
change the format its showing the original sinatra formart 

<div class="container">
  <h1>Welcome To Your Plant Cabinet </h1>
  <a href="/login">Login</a> or <a href="/signup">Sign Up</a>
</div>


*******
Layout page 
//customize the page with the if logged_in? statement... this lets the logged in user to see the menue you created... if they are logged out, you don't want them to see that page 
//this code goes right after <body> and before <div class= "wrapper">
<div class="nav">    
    <% if logged_in? %>  
    <li><a href="/logout">LOG OUT</a></li>
    <li><a href="/plants">LIST ALL PLANTS</a></li>
    <li><a href="/plants/new">CREATE A PLANT</a></li>
    <% end %>
  </div>

******

users show page 
// un hash the name and email so that it can show in the user's show page. You can add other html for to customize user's show page

<h1><%=@user.name %>'s Profile Page</h1>


<!-- <h1><%= @user.name %>'s Profile Page</h1>-->
<p>Email: <%= @user.email %></p>
<p>Name: <%= @user.name %></p>

This is the show page for an individual instance of your model. 

***********


********

 post '/plants' do  
    
    @plant = Plant.new(name: params[:name]
    @plant  = Plant.create(title: params[:title], user_id: current_user.id, description: params[:description], due_date: params[:due_date]
      #if params[:name] != "" && params[:description] != "" && params[:location] != "" && params[:light_requirement] != "" && params[:watering] != ""
      #if @plant.save 
      #@plant = Plant.create(name: params[:name])
         redirect "/plants/#{@plant.id}"
      #else
         redirect '/plants/new.html'
      #end

  end

  # GET: /plants/5
  # get "/plants/:id" do
    
  #   @plant = Plant.find(params[:id])

  #   erb :"/plants/show.html"

  # end

  # # GET: /plants/5/edit
  # get "/plants/:id/edit" do
  #   erb :"/plants/edit.html"
  # end

  # # PATCH: /plants/5
  # patch "/plants/:id" do
  #   redirect "/plants/:id"
  # end

  # # DELETE: /plants/5/delete
  # delete "/plants/:id/delete" do
  #   redirect "/plants"
  # end

  ************
  issue was with our new.erb we need to change our method and confirm that our action is st up correctly 

  ***********

<form class="" action="/plants/<%= @plant.id %>" method ="post">
<input type= "hidden" name ="_method" value ="patch">
<label for="name">Name: </label>
<input type="text" name="title" value="<%=@plant.name%>"><br><br>
<label for="description">Description: </label>
<!--<input type="text" name="description" value="<%=@palnt.description%>"><br><br>-->
<textarea type="text" name="description"><%= @list.description %></textarea><br></br>
<label for="location">location:</label>
<input type="text" name="location" value="<%=@name.location%>"><br><br>
<input type ="submit" name="" value="Edit List">
</form>