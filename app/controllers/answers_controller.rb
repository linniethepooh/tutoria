class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def new
    @answer = Answer.new
    @user = current_user
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
    params.require(:answer).permit(:content, :headline)
  end

  def set_restaurant
    @answer = Answer.find(params[:id])
  end
end
