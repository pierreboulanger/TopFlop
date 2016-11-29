class TopController < ApplicationController
  before_action :set_team, :set_game

  def new
    @top = Top.new
  end

  def create
    @top = Top.new(top_params)
    if @top.save
      flash[:notice] = "New top successfully created !!"
      redirect_to team_game_path(@team, @game)
    else
      flash[:notice] = @top.errors.messages
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

  def top_params
    params.require(:top).permit(:game_id, :user_id, :comment)
  end
end
