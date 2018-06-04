class PlayersController < ApplicationController
  before_action :set_player, :set_teams

  def show
    @player = Player.find(params[:id])
  end

  def edit

  end

  def update
    if @player.update(player_params)
      redirect_to team_path(@player.team_id)
    else
      flash[:notice] = "Oops something went wrong."
      render :show
    end
  end

  def new
    @player = Player.new
    raise
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      respond_to do |format|
        format.html { team_path(@player.team_id) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:user_id, :team_id, :name, :shirt_number, :field_position)
  end

  def set_teams
    @teams = Team.all
  end
end
