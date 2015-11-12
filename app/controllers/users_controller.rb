class UsersController < ApplicationController
  def index
    @users = User.all    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:message] = "You are now a registered user!"
    else
      flash[:message] = @user.errors.full_messages.to_sentence
    end

    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    flash.notice = "Post Updated!"


    redirect_to users_path
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:sucess] = "User destroyed"

    redirect_to users_path
  end

  def user_params
    return params.require(:user).permit(:username, :email, :password, :image)
  end
end
