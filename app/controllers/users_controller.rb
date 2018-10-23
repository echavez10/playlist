class UsersController < ApplicationController
  def new
  end

  def create
    @user=User.new user_params
    if @user.save
      redirect_to "/users/#{@user.id}"
      session[:user_id]=@user.id
    else    
      flash[:errors]=@user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  def show
    @user=User.find(params[:id])
    @song=Song.all

  end

  def all
    @user=User.find(params[:user_id])
    @song=@user.songs_added.group(:id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end