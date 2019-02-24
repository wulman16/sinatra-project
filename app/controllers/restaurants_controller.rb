class RestaurantsController < ApplicationController

  get '/restaurants/new' do
    erb :'/restaurants/new'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect "restaurants/#{@restaurant.id}"
  end

  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = User.all
    erb :'restaurants/show'
  end

  get '/restaurants' do
    @restaurants = Restaurant.all
    erb :'restaurants/index'
  end

  post '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @user = User.find(params["restaurant"]["user_id"])
    unless @restaurant.users.include?(@user)
      @restaurant.users << @user
    end
    redirect "restaurants/#{@restaurant.id}"
  end

end