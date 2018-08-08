class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_company, only: [:show, :edit, :update]

  def new
    @company = Company.new
    @user = current_user
    authorize @company
  end

  def show
    authorize @company
  end

  def create
    @company = current_user.build_company(company_params)
    @user = current_user
    if @company.save
      @user.manager!
      redirect_to company_path(@company)
    else
      render :new
    end
    authorize @company
  end

  def edit
    authorize @company
  end

  def update
    authorize @company
    byebug
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :city, :zipcode, :country)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
