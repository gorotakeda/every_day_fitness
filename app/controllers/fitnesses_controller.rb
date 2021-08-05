class FitnessesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @fitnesses = Fitness.includes(:user).order('created_at DESC')
  end

  def new
    @fitness = Fitness.new
  end

  def create
    @fitness = Fitness.new(fitness_params)
    if @fitness.save
      redirect_to root_path
    else
      render :new
    end
  end

private

  def fitness_params
    params.require(:fitness).permit(:title, :info, :category_id, :level_id).merge(user_id: current_user.id)
  end

  

end
