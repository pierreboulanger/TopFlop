class FlopController < ApplicationController
  before_action :set_team, :set_game

  def new
    @flop = Flop.new
  end

  def create
    @flop = Flop.new(flop_params)
    if @flop.save
      flash[:notice] = "Merci pour ton vote !!"
      redirect_to team_game_path(@team, @game)
    else
      flash[:notice] = @flop.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
  end

  private

  def set_team
    @team = Team.find(current_user.team_id)
  end

  def set_game
    @game = Game.find(params["game_id"])
  end

  def flop_params
    params.require(:flop).permit(:game_id, :user_id, :comment)
  end
end
