class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments
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
    @availables = @user.availables.where(taken: false)
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

    @appointment = Appointment.create!(available_id: params[:available], suggestion_id: params[:suggestion])
    @appointment.users << [@user1, @user2]

    @available = @appointment.available
    @available.taken = true
    @available.save

    @suggestion = @appointment.suggestion
    if @suggestion.flag
      @suggestion.taken = true
      @suggestion.save
    end

    @appointment.send_text_message

    redirect_to user_appointments_path(@user2) if @appointment.save
  end

  def edit
  end



  private

  def appointment_params
  end
end
