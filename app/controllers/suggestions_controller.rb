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
    @suggestion = @user.suggestions.build(suggestion_params)

    redirect_to user_suggestions_path(@user) if @suggestion.save
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
