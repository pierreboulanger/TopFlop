class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    @player = Player.new(user_id: current_user.id, team_id: 1, name: "Prénom Nom")
    @player.save
    edit_player_path(@player)
  end

end
