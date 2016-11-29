class GamesController < ApplicationController
  before_action :find_team, only: [:new, :create]
  before_action :set_game, :set_tops, :set_flops, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = @team.games.build(game_params)
    #does the same thing as :
    # @game = Game.new
    # @game.cocktail = @cocktail
    # @game.save

    if @game.save
      flash[:notice] = "New game successfully created !!"
      redirect_to team_path(@team)
    else
      flash[:notice] = @game.errors.messages
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

  def find_team
    @team = Team.find(params[:team_id])
  end

  def set_game
    find_team
    @game = @team.games.find(params[:id])
  end

  def set_tops
    set_game
    @tops = @game.tops
  end

  def set_flops
    set_game
    @flops = @game.flops
  end

  def game_params
    params.require(:game).permit(:opponent_name, :date)
  end
end
