class AvailablesController < ApplicationController
  def index
    @user = current_user
    @availables = @user.availables.where(taken: false)
  end

  def show
    @user = User.find(params[:user_id])
    @suggestion = Suggestion.find(params[:suggestion_id])
    @available = Available.find(params[:id])
  end

  def new
    @user = current_user
    @available = Available.new
  end

  def create
    @user = current_user
    @available = @user.availables.build
    @available.slot = DateTime.parse(params[:available][:slot])

    redirect_to user_availables_path(@user) if @available.save
  end

  def edit
    @user = current_user
    @available = Available.find(params[:id])
  end

  def update
    @available = Available.find(params[:id])
    slot = DateTime.parse(params[:available][:slot])
    @available.update_attributes(:slot => slot)
    redirect_to user_availables_path(current_user) if @available.save
  end

  def destroy
    @available = Available.find(params[:id])

    redirect_to user_availables_path(current_user) if @available.destroy
  end

end
