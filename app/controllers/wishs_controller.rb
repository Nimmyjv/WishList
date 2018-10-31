class WishsController < ApplicationController
  get '/wishs' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'wishs/show'
  end
   get '/wishs/new' do
    redirect_if_not_logged_in
    erb :'/wishs/new'
  end
end