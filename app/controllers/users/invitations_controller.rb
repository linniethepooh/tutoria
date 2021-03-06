class Users::InvitationsController < Devise::InvitationsController
  def new
    if current_user.status != "manager"
      redirect_to dashboard_path, alert: "Not authorized"
    end
    super
  end
  def create
    self.resource = invite_resource {|resource| resource.company = current_user.company }
    redirect_to dashboard_path
  end
end
