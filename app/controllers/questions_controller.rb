class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def create
    @question = Question.new(question_params)
    @question.step_id = question_step.to_i
    @question.save
    step = Step.find(params[:step_id])
    tutorial = step.tutorial
    company = tutorial.company
    redirect_to  company_tutorial_path(company.id, tutorial.id)
    authorize @question
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
    authorize @question
    redirect_to dashboard_path
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

  def question_step
    params[:step_id]
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
