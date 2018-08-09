class Users::InvitationsController < Devise::InvitationsController

  def create
    self.resource = invite_resource {|resource| resource.company = current_user.company }
  end
end
