class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  after_action :verify_authorized, except: [:show, :index], unless: :skip_pundit?
  before_action :find_tutorial, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @steps = @tutorial.steps
    @question = Question.new
  end

  def destroy
    authorize @tutorial
    if @tutorial.destroy
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def new
    @tutorial = Tutorial.new()
    authorize @tutorial
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.company = current_user.company
    if @tutorial.save
      CaptionJob.perform_later(@tutorial.id)
      sleep(1.0/1000.0)
      ResizeJob.perform_later(@tutorial.id)
      sleep(1.0/1000.0)
      ThumbnailJob.perform_later(@tutorial.id)
      redirect_to edit_company_tutorial_path(@tutorial.company, @tutorial)
    else
      render :new
    end
    authorize @tutorial
  end

  def edit
    @step = Step.new
    @steps = @tutorial.steps
    @company = @tutorial.company
    authorize @tutorial
  end

  def update
    authorize @tutorial
    if @tutorial.update(tutorial_params)
      @steps = @tutorial.steps
      redirect_to edit_company_tutorial_path(@tutorial.company, @tutorial)
    else
      redirect_to edit_company_tutorial_path(@tutorial.company, @tutorial)
    end
  end

  private

  def find_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(:title, :product, :description, :file, :subtitle)
  end
end
