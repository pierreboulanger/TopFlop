class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.name != nil
      team_path(Team.find(current_user.team_id))
    else
      edit_team_user_path(Team.find(1), current_user)
    end
  end

end
