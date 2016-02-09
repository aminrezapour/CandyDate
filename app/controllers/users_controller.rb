class UsersController < ApplicationController
  def show
    @user = User.find(current_user)
  end

  def update
    @user = current_user
    number = params[:user][:telephone].delete("-")
    @user.update_attribute(:telephone, number)
    if Invitation.where(invitee_tel: @user.telephone)
      @user.invitations << Invitation.where(invitee_tel: @user.telephone)
    end
    redirect_to(@user) if @user.save
  end
end
