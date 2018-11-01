class CollectionsController < ApplicationController

  get '/collections/new' do
    redirect_if_not_logged_in
    erb :'/collections/new'
  end

  post '/collections/new' do
    @user = current_user
    collection = @user.collections.create(:name => params[:name])
    wish = collection.wishes.create(:name => params[:wishes][:name])
    redirect '/wishes'
  end

  get '/collections/:id/edit' do
    redirect_if_not_logged_in
    @collection = Collection.find_by_id(params[:id])
    erb :'collections/edit'
  end

  patch '/collections/:id' do
    @collection = Collection.find_by_id(params[:id])
    @collection.name = params[:name]
    @collection.save
    redirect '/wishes'
  end

  get '/collections/:id/delete' do
    @collection = Collection.find_by_id(params[:id])
    erb :'collections/delete'
  end

  delete '/collections/:id' do
    @collection = Collection.find_by_id(params[:id])
    @collection.destroy
    redirect '/wishes'
  end
end