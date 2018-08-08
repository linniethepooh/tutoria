class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_company, only: [:show]

  def new
    @company = Company.new
    @user = current_user
    authorize @company
  end

  def show
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    @user = current_user
    if @company.save!
      redirect_to companies_path(@company)
      @user.manager!
    else
      render :new
    end
    authorize @company
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :city, :zipcode, :country)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
