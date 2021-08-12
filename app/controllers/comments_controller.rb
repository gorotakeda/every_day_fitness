class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to fitness_path(@comment.fitness)
    else
      @fitness = @comment.fitness
      @comments = @fitness.comments
      render "fitnesses/show" 
    end
  end
private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, fitness_id: params[:fitness_id])
  end
end