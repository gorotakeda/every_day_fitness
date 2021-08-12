class LikesController < ApplicationController
  before_action :fitness_params
  def create
    Like.create(user_id: current_user.id, fitness_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, fitness_id: params[:id]).destroy
  end

  private

  def fitness_params
    @fitness = Fitness.find(params[:id])
  end
end
