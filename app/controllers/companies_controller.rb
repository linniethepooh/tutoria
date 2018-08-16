class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_company, only: [ :edit, :update, :company]

  def new
    @company = Company.new
    @user = current_user
    authorize @company
  end

  def show
    @company = Company.find_by_name(params[:name])
    if params[:query].present?
      sql_query = " \
        tutorials.title @@ :query \
        OR tutorials.description @@ :query \
        "
      @tutorials = @company.tutorials.where(sql_query, query: "%#{params[:query]}%")
    else
      @tutorials = @company.tutorials
    end
    authorize @company
  end

  def create
    @company = current_user.build_company(company_params)
    @user = current_user
    if @company.save!
      @user.manager!
      redirect_to company_path(@company.name)
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
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def destroy
    authorize @company
    @company.destroy
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :city, :zipcode, :country, :banner)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
