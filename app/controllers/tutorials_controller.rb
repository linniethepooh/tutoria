class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  after_action :verify_authorized, except: [:show, :index], unless: :skip_pundit?
  before_action :find_tutorial, only: [:show, :edit, :update]

  def index
  end

  def show
    @steps = @tutorial.steps
  end

  def destroy
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_tutorial
    @tutorial = Tutorial.find(params[:id])
  end
end
