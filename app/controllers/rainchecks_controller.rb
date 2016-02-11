class RainchecksController < ApplicationController
  def show
    @raincheck = Raincheck.find(params[:id])
    @invitation = @raincheck.invitation
    @suggestion = @invitation.suggestions.first
    @user = current_user
    @appointment = Appointment.new

    today = Date.today
    @availables = []
    for i in 0..14 do
      @availables << today + i
    end
    upcoming_appointments = @user.appointments.upcoming
    for v in upcoming_appointments do
      @availables.delete(v.day)
    end
  end

  def new
    @raincheck = Raincheck.new
    @invitation = Invitation.find(params[:invitation_id])
    @r_inviter = @invitation.invitee
    @r_invitee = @invitation.inviter
    @suggestions = @invitation.suggestions

    today = Date.today
    @availables = []
    for i in 0..14 do
      @availables << today + i
    end
    upcoming_appointments = @r_inviter.appointments.upcoming
    for v in upcoming_appointments do
      @availables.delete(v.day)
    end
  end

  def create
    @invitation = Invitation.find(params[:invitation_id])
    @raincheck = Raincheck.new
    @invitation.raincheck = @raincheck
    @raincheck.days_rainchecker = params[:availables_id].split
    @invitation.suggestions = [ Suggestion.find(params[:suggestion_id]) ]

    if @raincheck.save
      # send message
      flash[:notice] = "Rain check created."
      redirect_to user_invitations_path(current_user)
    else
      flash[:error] = "Wasn't able to rain check"
      redirect_to user_invitations_path(current_user)
    end
  end
end
