class SongsController < ApplicationController
  def new
  end

  def show
    @song=Song.find(params[:song_id])
    @users=@song.users.group(:id)
  end

  def create
    @user=current_user
    @song=Song.create(title: params[:title], artist:params[:artist], user_id:session[:user_id])
    if @song.save
      @user.id=session[:user_id]
      redirect_to "/users/#{@user.id}"
    else    
      flash[:errors]=@song.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end

  def add
    @user=current_user
    @song=Track.create(user_id: session[:user_id], song: Song.find_by_id(params[:id]))
    if @song.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors]=@song.errors.full_messages
      redirect_to "/users/#{@user.id}"
    end
  end
end