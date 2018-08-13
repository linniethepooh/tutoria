class UsersController < ApplicationController

  def dashboard
    authorize current_user
    @user = current_user
    @company = current_user.company
    @tutorials = @company.tutorials.sort_by &:created_at
    @staff = @company.users
    @questions = Question.where(answered: false)
    @answer = Answer.new
  end

  def destroy
    authorize current_user
    staff = User.find(params[:id])
    staff.destroy
    redirect_to dashboard_manager_path
  end

  def make_manager
    authorize current_user
    staff = User.find(params[:user_id])
    staff.manager!
    redirect_to dashboard_manager_path
  end


  private

  def user_not_authorized
    flash[:alert] = "You do not have permission to access this page."
    redirect_to(root_path)
  end

end
