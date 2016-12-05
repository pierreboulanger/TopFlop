class TopController < ApplicationController
  before_action :set_team, :set_game, :set_flop, :has_voted_top_player, :has_voted_flop_player

  def new
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "=> controller: top, action: NEW"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @top = Top.new
  end

  def create
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "=> controller: top, action: create"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @top = Top.new(top_params)

    if @top.save
      respond_to do |format|
        # @uservote = Uservote.new(user_id: current_user.id, top_id: @top.id)
        flash[:notice] = "Merci pour ton vote !!"
        format.html { team_game_path(@team, @game) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        flash[:notice] = @top.errors.messages
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
  end

  private

  # PRELOAD METHODS

  def set_team
    @team = Team.find(current_user.team_id)
  end

  def set_game
    @game = Game.find(params["game_id"])
  end

  def set_flop
    @flop = Flop.new
  end

  def top_params
    params.require(:top).permit(:game_id, :user_id, :topplayer, :comment)
  end

  # USER HAS VOTED ???

  def has_voted_top_player
    @voted_top_player = false

    current_user.tops.each do |top|
      if top.game_id == @game.id
        @voted_top_player = true
        break
      else
        @voted_top_player = false
      end
    end
  end

  def has_voted_flop_player
    @voted_flop_player = false

    current_user.flops.each do |flop|
      if flop.game_id == @game.id
        @voted_flop_player = true
        break
      else
        @voted_flop_player = false
      end
    end
  end

end
