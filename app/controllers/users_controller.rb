class UsersController < ApplicationController

  def dashboard_manager
    authorize current_user
    @user = current_user
    @company = current_user.company
    @tutorials = @company.tutorials.sort_by &:created_at
    @staff = @company.users
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end
