class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @profile = @user.profile
    @fitnesses = @user.fitnesses
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if current_user.update(user_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile)
  end
end
