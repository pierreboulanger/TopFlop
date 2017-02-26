class GamesController < ApplicationController
  before_action :find_team, only: [:show, :new, :create, :update]
  before_action :set_game, :set_players, only: [:show, :edit, :update, :destroy]
  before_action :set_comments, only: :show

  def index
  end

  def show
    final_top
    final_flop
    has_voted
    raise
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

    # OPEN VOTE
    if params[:open] != nil
      if @game.update(open: params[:open])
        flash[:notice] = "Les votes sont lancés !"
        redirect_to team_game_path(@team, @game)
      else
        flash[:notice] = "Oops il y a un Bug !"
        render :show
      end
    end

    # UPDATE TOP
    if params[:top] != nil && params[:flop] != nil
      top_name = @players.find(params[:top]).name
      flop_name = @players.find(params[:flop]).name

      if @game.update(top: top_name)
        if @game.update(flop: flop_name)
          flash[:notice] = "Vote bien cloturé !"
          redirect_to team_game_path(@team, @game)
        else
          flash[:notice] = "Oops il y a un Bug avec le Flop !"
          render :show
        end
      else
        flash[:notice] = "Oops il y a un Bug avec le Top !"
        render :show
      end
    end

    # UPDATE FLOP
    # if params[:flop] != nil
    #   flop_name = @players.find(params[:flop]).name
    #   if @game.update(flop: flop_name)
    #     flash[:notice] = "Vote bien cloturé !"
    #     redirect_to team_game_path(@team, @game)
    #   else
    #     flash[:notice] = "Oops il y a un Bug !"
    #     render :show
    #   end
    # end

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

  def set_comments
    set_game
    set_tops
    set_flops
    @comments = []

    @comments = @tops.zip(@flops)
    raise
  end

  def set_players
    find_team
    @players = @team.users
  end

  def game_params
    params.require(:game).permit(:opponent_name, :date, :open)
  end

  # FINAL COUNT TOP and FLOP METHOD

  def final_top
    top_list = []

    # Get all the user selected for top
    @tops.each do |top|
      top_list << @players.find(top.topplayer)
    end

    # Sort the list with count
    @count_tops = top_list.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

    # Reverse in order to have most voted first
    @count_tops = @count_tops.sort_by {|k,v| v}.reverse
  end

  def final_flop
    flop_list = []

    @flops.each do |flop|
      flop_list << @players.find(flop.flopplayer)
    end
    # Sort the list with count
    @count_flops = flop_list.each_with_object(Hash.new(0)) { |o, h| h[o] += 1 }

    # Reverse in order to have most voted first
    @count_flops = @count_flops.sort_by {|k,v| v}.reverse
  end

  # USER HAS VOTED ??

  def has_voted
    @voted = false

    current_user.tops.each do |top|
      if top.game_id == @game.id
        @voted = true
        break
      else
        @voted = false
      end
    end
  end

end
