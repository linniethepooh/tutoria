class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def new
    @question = Question.new
    authorize @question
  end

  def create
    @question = Question.new(question_params)
    @question.save
    authorize @question
    raise
  end

  def show
    #render
  end

  def edit
    #render
  end

  def update
    if @question.update(question_params)
      redirect_to answer_path(@answer)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:content, :headline)
  end

  def set_restaurant
    @question = Question.find(params[:id])
  end
end
