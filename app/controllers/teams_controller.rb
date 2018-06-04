class TeamsController < ApplicationController
  before_action :find_games, only: :show
  before_action :set_player, :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to edit_team_user_path(@team, current_user)
    else
      flash[:notice] = @team.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def set_player
    @player = Player.find_by(user_id: current_user.id, team_id: @team.id)
  end

  def find_games
    set_team
    @games = @team.games
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
