class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
  end

  def update
    @user = current_user
    @user.update_attribute(:telephone, params[:user][:telephone])
    redirect_to(@user) if @user.save
  end

  def user_select
    
  end

  def user_preview
    @user = User.find_by_telephone(params[:tel])
    if @user.nil?
      flash[:error] = "Wrong Number"
      redirect_to current_user
    else
      redirect_to "/users/#{@user.id}/moods"
    end

  end
end
