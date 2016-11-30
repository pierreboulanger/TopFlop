class GamesController < ApplicationController
  before_action :find_team, only: [:show, :new, :create, :update]
  before_action :set_game, :set_players, only: [:show, :edit, :update, :destroy]
  before_action :set_tops, :set_flops, only: :show

  def index
  end

  def show
    final_top
    final_flop
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
      flash[:notice] = "Nouveau match créé !"
      redirect_to team_path(@team)
    else
      flash[:notice] = @game.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    top_name = @players.find(params[:top]).name

    if @game.update(top: top_name) || @game.update(flop: flop_name)
      flash[:notice] = "Vote bien cloturé !"
      redirect_to team_game_path(@team, @game)
    else
      flash[:notice] = "Oops il y a un Bug !"
      render :show
    end
  end

  def destroy
  end

    private


  # PRELOAD METHODS

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

  def set_players
    find_team
    @players = @team.users
  end

  def game_params
    params.require(:game).permit(:opponent_name, :date)
  end


  # FINAL COUNT TOP and FLOP METHOD

  def final_top
    top_list = []

    # Get all the user selected for top
    @tops.each do |top|
      top_list << @players.find(top.user_id)
    end

    # Sort the list with count
    @count_tops = top_list.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

    # Reverse in order to have most voted first
    @count_tops = @count_tops.sort_by {|k,v| v}.reverse
  end

  def final_flop
    flop_list = []

    @flops.each do |flop|
      flop_list << @players.find(flop.user_id)
    end
    # Sort the list with count
    @count_flops = flop_list.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

    # Reverse in order to have most voted first
    @count_flops = @count_flops.sort_by {|k,v| v}.reverse
  end

end
