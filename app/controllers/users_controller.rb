class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @favorites = current_user.restaurants
  end
end
