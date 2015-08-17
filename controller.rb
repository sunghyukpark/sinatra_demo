require 'sinatra'
require './models/coach'

get '/' do
  #show a list of all coaches
  #looks like an instance variable
  #@ expands the scope of this variable
  #this variable is available to the view
  #
  # jason = "hi jason"
  @coaches = Coach.all
  erb :index
  #embedded ruby, renders a file by name
end

# what is the point of sinatra
# what is a route
# what is an "instance" variable
# what does erb mean, diff type of erb tags


#create a coach
#show a new coach form(blank)
#submit the form
get '/coaches/new' do
  erb :new
end

get '/coaches/:id/edit' do
  @coach = Coach.find(params[:id].to_i)
  erb :edit
end

get '/coaches/:id' do
  #colon syntax in the path --placeholder, becomes a key in params
  #params - implicitly defined local variable that is created in every http request(or every time a rounte is executed)
  #hash
  #values come from what the user typed in the browser
  @coach = Coach.find(params[:id].to_i)
  erb :show
end


post '/coaches' do
  Coach.create(params)
  redirect '/'
  # puts params
  # puts params[:coach_name]
  # name = params[:coach_name]
  # coach = Coach.create(params[:coach_name])
  # redirect '/'
end

put '/coaches/:id' do
  Coach.update(params)
  redirect '/'
end

delete '/coaches/:id' do
  @coach = Coach.find(params[:id].to_i)
  @coach.destroy
  redirect '/'
end
