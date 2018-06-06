class TeamsController < ApplicationController
  before_action :set_team, :set_player_after_team, :find_games, only: [:show, :edit, :update, :destroy]
  before_action :set_player_before_team, only: [:new, :create]

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
      redirect_to edit_player_path(@player)
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
    authorize @team
  end

  def set_player_after_team
    @player = Player.find_by(user_id: current_user.id, team_id: @team.id)
  end

  def set_player_before_team
    @player = Player.find_by(user_id: current_user.id)
  end

  def find_games
    set_team
    @games = @team.games
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
