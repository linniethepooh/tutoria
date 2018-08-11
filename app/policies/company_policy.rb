  class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    check_company_manager
  end

  def update?
    check_company_manager
  end

  def destroy?
    check_company_manager
  end

  private

  def check_company_manager
    user.company == record && user.status == "manager"
  end
end
