class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments.order(day: :asc)

    respond_to do |format|
        format.html
        format.js
    end
  end

  def show
  end

  def create
    @invitation = Invitation.find(params[:invitation_id])
    @suggestion = Suggestion.find(params[:suggestion_id])
    @invitee = current_user
    @inviter = @invitation.users.first
    days_inviter = @invitation.days_inviter
    days_invitee = params[:available_id]
    @appointment = @inviter.appointments.create!
    @appointment.users << @invitee
    @appointment.suggestion = @suggestion

    for d in days_inviter do
      if days_invitee.include?(d)
        day = d
        break
      end
    end

    # if no overlap, some function must be triggered
    unless day.nil?
      @appointment.day = day
    end

    if @appointment.save
      # a message sent to both numbers
      @invitation.confirmed = true
      @invitation.save
      flash[:notice] = "Congratulations! You both are free on #{day}"
      redirect_to user_appointments_path(@invitee)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @appointment = Appointment.find(params[:id])

    redirect_to user_appointments_path(current_user) if @appointment.destroy
  end



  private

  def appointment_params
  end
end
