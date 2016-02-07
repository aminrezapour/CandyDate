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
      flash[:notice] = "Suggestion saved successfully."
      redirect_to user_suggestions_path(@user)
    else
      flash[:alert] = "Suggestion failed to save."
      render :new
    end
  end

  def edit
    @user = current_user
    @suggestion = @user.suggestions.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    redirect_to user_suggestions_path(current_user) if @suggestion.update(suggestion_params)
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
