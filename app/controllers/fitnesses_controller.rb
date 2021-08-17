class FitnessesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_fitness, only: [:show, :edit, :update, :destroy]
  before_action :search_product, only: [:index, :search, :show]
  def index
    @fitnesses = Fitness.includes(:user).order('created_at DESC')
    set_fitness_column
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

  def show
    @comment = Comment.new
    @comments = @fitness.comments.includes(:user)
    set_fitness_column
  end

  def edit

  end

  def update
    if @fitness.update(fitness_params)
      redirect_to fitness_path
    else
      render :edit
    end
  end

  def destroy
    if @fitness.user_id = current_user.id
      @fitness.destroy
      redirect_to root_path
    end
  end

  def search
    @results = @p.result
  end


 private

  def fitness_params
    params.require(:fitness).permit(:title, :info, :category_id, :level_id).merge(user_id: current_user.id)
  end

  def set_fitness
    @fitness = Fitness.find(params[:id])
  end

  def search_product
    @p = Fitness.ransack(params[:q])
  end

  def set_fitness_column
    @fitness_name = Fitness.select("title").distinct
  end

end
