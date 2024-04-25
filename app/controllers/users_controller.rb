class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    logger.debug
    if @user.save
      redirect_to root_path
    else
      redirect_to new_user_registration_path
      put 
    end
  end

  def account
    @user =  current_user
  end

  def profile
    @user =  current_user
  end
  
  def edit_profile
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_users_path
    else 
      render :edit_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :introduction)
  end
end
