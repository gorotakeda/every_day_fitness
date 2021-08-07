class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @profile = @user.profile
    @fitnesses = @user.fitnesses
  end
end
