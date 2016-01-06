class MoodsController < ApplicationController
  def index
    @user = current_user
    @moods = @user.moods
  end

  def show
    @mood = Mood.find(params[:id])
  end
end
