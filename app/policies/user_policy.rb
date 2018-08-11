class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    true
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

  def check_staff_status
    record.status == "staff"
  end

end
