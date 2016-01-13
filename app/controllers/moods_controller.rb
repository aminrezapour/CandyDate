class MoodsController < ApplicationController
  def index
    @moods = Mood.all
    @user = User.find(params[:user_id])
  end

  def show
    @mood = Mood.find(params[:id])
    @user = User.find(params[:user_id])
    @suggestions = @user.suggestions.select{|s| s.moods.where(id: @mood.id).count > 0}
  end
end
