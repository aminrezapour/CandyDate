class SuggestionsController < ApplicationController
  def index
    @user = current_user
    @suggestions = @user.suggestions
  end

  def show
    # more will be added
  end

  def new
    @user = current_user
    @suggestion = Suggestion.new
  end

  def create
    @user = current_user
    @suggestion = @user.suggestions.new(suggestion_params)

    if @suggestion.save
      flash[:notice] = "Place saved successfully."
      redirect_to user_suggestions_path(@user)
    else
      flash[:alert] = "Place failed to save."
      render :new
    end
  end

  def edit
    @user = current_user
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @user = current_user
    @suggestion = Suggestion.find(params[:id])
    @suggestion.assign_attributes(suggestion_params)
    if @suggestion.save
      flash[:notice] = "Place updated successfully."
      redirect_to user_suggestions_path(current_user)
    else
      flash[:alert] = "Place failed to update."
      render :edit
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])

    redirect_to user_suggestions_path(current_user) if @suggestion.destroy
  end



  private

  def suggestion_params
    params.require(:suggestion).permit(:name, :description, :event, :public)
  end
end
