class SessionsController < ApplicationController
  def new
  end

  def create
  	@user=User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])
  		redirect_to "/users/#{@user.id}"
  		session[:user_id]=@user.id
  	else	
  		flash[:errors]=["Invalid combination"]
  		redirect_to "/users/new"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/users/new'
  end
end