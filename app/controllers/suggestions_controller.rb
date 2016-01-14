class SuggestionsController < ApplicationController
  def index
    @user = current_user
    @suggestions = @user.suggestions
  end

  def show
    @user = User.find(params[:user_id])
    @suggestion = Suggestion.find(params[:id])
    @availables = @user.availables.where(taken: false)
  end

  def new
    @user = current_user
    @suggestion = Suggestion.new
    @moods = Mood.all
  end

  def create
    @user = current_user
    @suggestion = @user.suggestions.build(suggestion_params)

    redirect_to user_suggestions_path(@user) if @suggestion.save
  end

  def edit
    @user = current_user
    @suggestion = Suggestion.find(params[:id])
    @moods = Mood.all
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
    params.require(:suggestion).permit(:name, :description, :mood_ids => [])
  end
end
