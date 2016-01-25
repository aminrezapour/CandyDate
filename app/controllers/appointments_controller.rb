class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments.order(slot: :asc)
  end

  def find_user
  end

  def suggestion_index
    @user = User.find_by_telephone(params[:tel])
    @suggestions = @user.suggestions.where(taken: false)
  end

  def available_index
    @user = User.find(params[:other_user])
    @suggestion = Suggestion.find(params[:suggestion])
    @availables = @user.availables.order(slot: :asc)
  end

  def new
    @user = User.find(params[:other_user])
    @suggestion = Suggestion.find(params[:suggestion])
    @available = Available.find(params[:available])
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @user1 = User.find(params[:other_user])
    @user2 = current_user

    slot = Available.find(params[:available]).slot

    @appointment = Appointment.create!(slot: slot, suggestion_id: params[:suggestion])
    @appointment.users << [@user1, @user2]

    Available.find(params[:available]).destroy

    @suggestion = @appointment.suggestion
    if @suggestion.flag
      @suggestion.taken = true
      @suggestion.save
    end

    # @appointment.send_text_message

    redirect_to user_appointments_path(@user2) if @appointment.save
  end

  def edit
  end



  private

  def appointment_params
  end
end
