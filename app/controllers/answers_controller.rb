class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id].to_i
    @answer.save
    @answer.question.answered = true
    @answer.question.save
    authorize @answer
    redirect_to dashboard_path
  end

  def show
    #render
  end

  def edit
    #render
  end

  def update
    if @answer.update(answer_params)
      redirect_to answer_path(@answer)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
  end

  private

  def answer_params
    params.require(:question).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
