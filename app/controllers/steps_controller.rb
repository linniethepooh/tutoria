class StepsController < ApplicationController
  skip_after_action :verify_authorized

  def destroy
    find_step
    tutorial = @step.tutorial
    company = tutorial.company
    @step.destroy
    redirect_to edit_company_tutorial_path(company.name, tutorial.id)

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
    find_step
  end

  def update
    find_step
    @step.update(step_params)
    tutorial = @step.tutorial
    company = tutorial.company
    redirect_to edit_company_tutorial_path(company.name, tutorial.id)
  end

  private

  def find_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:start_time, :headline, :description, :materials)
  end
end
