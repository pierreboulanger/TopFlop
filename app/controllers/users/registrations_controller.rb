class Users::RegistrationsController < Devise::RegistrationsController

  private

  def after_sign_up_path_for(resource)
    @player = Player.new(user_id: current_user.id, team_id: 1, name: "Prénom Nom")
    @player.save
    edit_player_path(@player)
  end
end
