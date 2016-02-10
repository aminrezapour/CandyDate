class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    number = params[:user][:telephone].delete("-")
    @user.update_attribute(:telephone, number)

    if Invitation.where(invitee_tel: number)
      @user.invitations << Invitation.where(invitee_tel: number)
    end

    redirect_to(@user) if @user.save
  end
end
