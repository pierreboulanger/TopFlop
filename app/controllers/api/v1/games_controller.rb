class Api::V1::GamesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_game, only: [ :show, :update ]
  before_action :set_team, only: [ :create ]


  def index
    @games = policy_scope(Game)
  end

  def show
  end

  def create
    @game = @team.games.build(game_params)
    authorize @game
    if @game.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @game.update(game_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
    authorize @game
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def game_params
    params.require(:game).permit(:opponent_name, :date)
  end

  def render_error
    render json: { errors: @game.errors.full_messages },
      status: :unprocessable_entity
  end

end
