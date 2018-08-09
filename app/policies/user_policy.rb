class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard_manager?
    check_manager_status
  end

  def destroy?
    check_manager_status
  end

  def make_manager?
    check_manager_status
  end

  private

  def check_manager_status
    record.status == "manager"
  end

end
