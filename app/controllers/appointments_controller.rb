class AppointmentsController < ApplicationController
  def index
    @user = current_user
    @appointments = @user.appointments
  end

  def show
  end

  def create
    @user1 = User.find(params[:user_id])
    @user2 = current_user

    @appointment = Appointment.create!(available_id: params[:available_id], suggestion_id: params[:suggestion_id])
    @user1.datings.create!(appointment: @appointment)
    @appointment.users << @user2

    @available = Available.find(params[:available_id])
    @available.taken = true
    @available.save

    @appointment.save
    @appointment.send_text_message

    redirect_to user_appointments_path(@user2) if @appointment.save
  end

  def edit
  end



  private

  def appointment_parameters
  end
end
