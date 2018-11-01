class WishesController < ApplicationController

  get '/wishes' do
    redirect_if_not_logged_in
    @user = current_user
    @wishes = @user.collections
    erb :'wishes/show'
  end

  get '/wishes/new' do
    redirect_if_not_logged_in
    @user = current_user
    @collections = Collection.all
    erb :'/wishes/new'
  end

  post '/wishes/new' do
    Wish.create(:name => params[:name], :collection_id => params[:collection_id])
    redirect '/wishes'
    end

  get '/wishes/new/:id' do
    redirect_if_not_logged_in
    @collection = Collection.find_by_id(params[:id])
    erb :'/wishes/new_on_list'
  end

  post '/wishes/new/:id' do
    @collection = Collection.find_by_id(params[:id])
    Wish.create(:name => params[:name], :collection_id => params[:id])
    redirect '/wishes'
  end

  get '/wishs/:id/edit' do
    @wish = Wish.find_by_id(params[:id])
    erb :'/wishes/edit'
  end

  patch '/wishes/:id' do
    @wish = Wish.find_by_id(params[:id])
    @wish.name = params[:name]
    @wish.save
    redirect '/wishes'
  end

  get '/wishes/:id/delete' do
    @wish = Wish.find_by_id(params[:id])
    erb :'/wishes/delete'
  end

  delete '/wishes/:id' do
    @wish = Wish.find_by_id(params[:id])
    @wish.destroy
    redirect '/wishes'
  end
end