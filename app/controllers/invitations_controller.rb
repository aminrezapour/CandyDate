class InvitationsController < ApplicationController
  def index
    @user = current_user
    @invitations = @user.invitations.where(confirmed: false).order(created_at: :asc)
  end

  def find_user
    @user = current_user
  end

  def show
    @user = current_user
    @invitation = @user.invitations.find(params[:id])
    @suggestions = @invitation.suggestions
    @appointment = @user.appointments.new

    today = Date.today
    @availables = []
    for i in 0..7 do
      @availables << today + i
    end
    upcoming_appointments = @user.appointments.upcoming
    for v in upcoming_appointments do
      @availables.delete(v.day)
    end
  end

  def new
    @inviter = current_user
    @invitation = @inviter.invitations.new
    @inviter_suggestions = @inviter.suggestions.where(taken: false)

    @invitee_tel = params[:tel]
    if User.find_by_telephone(@invitee_tel)
      @invitee = User.find_by_telephone(@invitee_tel)
      @invitee_suggestions = @invitee.suggestions.where(public: true).where(taken: false)
    end

    today = Date.today
    @availables = []
    for i in 0..7 do
      @availables << today + i
    end
    upcoming_appointments = @inviter.appointments.upcoming
    for v in upcoming_appointments do
      @availables.delete(v.day)
    end
  end

  def create
    @inviter = current_user
    @invitation = Invitation.new
    @invitation.users << @inviter
    invitee_tel = params[:invitee_tel]
    @invitation.invitee_tel = invitee_tel
    if User.find_by_telephone(invitee_tel)
      @invitee = User.find_by_telephone(invitee_tel)
      @invitation.users << @invitee
      @invitation.invitee_name = @invitee.name
    else
      @invitation.invitee_name = params[:invitee_name]
    end
    suggestions_id = params[:suggestions_id].split
    for id in suggestions_id
      @invitation.suggestions << Suggestion.find(id)
    end
    @invitation.days_inviter = params[:availables_id].split

    # txt message to be added

    if @invitation.save
      flash[:notice] = "Invitation created successfully, a text message was sent to #{invitee_tel}"
      redirect_to user_invitations_path(@inviter)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @invitation = Invitation.find(params[:id])

    if @invitation.destroy
      flash[:alert] = "Invitation deleted"
      redirect_to user_invitations_path(current_user)
    end
  end

end
