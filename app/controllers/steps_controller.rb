class StepsController < ApplicationController
  skip_after_action :verify_authorized

  def destroy
  end

  def new
  end

  def create
    @step = Step.new(step_params)
    @tutorial = Tutorial.find(params[:tutorial_id])
    @step.tutorial = @tutorial
    @step.save
    @steps = @tutorial.steps
    respond_to do |format|
        format.html { redirect_to root_path }
        format.js
    end
  end

  def edit
  end

  def update
  end

  private

  def find_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:start_time, :headline, :description, :materials)
  end
end
