class UsersController < ApplicationController

  def dashboard
    authorize current_user
    @user = current_user
    @company = current_user.company
    @tutorials =  @company.tutorials.order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
        tutorials.title ILIKE :query \
        OR tutorials.description ILIKE :query \
        "
      @tutorials = @tutorials.where(sql_query, query: "%#{params[:query]}%")
    end

    @staff = @company.users
    @questions = Question.where(answered: false)
    @answer = Answer.new

    respond_to do |format|
       format.html
       format.js
     end
  end

  def destroy
    authorize current_user
    staff = User.find(params[:id])
    staff.destroy
    redirect_to dashboard_path
  end

  def make_manager
    authorize current_user
    staff = User.find(params[:user_id])
    staff.manager!
    redirect_to dashboard_path
  end

  private

  def user_not_authorized
    flash[:alert] = "You do not have permission to access this page."
    redirect_to(root_path)
  end

end
