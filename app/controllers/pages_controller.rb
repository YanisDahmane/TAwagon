class PagesController < ApplicationController
  def home
    @user = current_user
    @games = current_user.games
  end
end
