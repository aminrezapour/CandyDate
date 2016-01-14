class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
  end

  def update
    @user = current_user
    @user.update_attribute(:telephone, params[:user][:telephone])
    redirect_to(@user) if @user.save
  end
end
