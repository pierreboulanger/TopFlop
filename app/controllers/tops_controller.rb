class TopsController < ApplicationController
  before_action :set_team, :set_game, :set_player, :set_flop, :has_voted_top_player, :has_voted_flop_player
  before_action :set_top_and_flop, only: [:edit, :update]

  def new
    @top = Top.new
    authorize @top
  end

  def create
    @top = Top.new(top_params)
    authorize @top

    if @top.save
      respond_to do |format|
        # @uservote = Uservote.new(user_id: current_user.id, top_id: @top.id)
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
    if @top.update(top_params)
      respond_to do |format|
        flash[:notice] = "Vote modifié !"
        format.html { team_game_path(@team, @game) }
        format.js  # <-- will render `app/views/reviews/update.js.erb`
      end
    else
      respond_to do |format|
        flash[:notice] = "Oops something went wrong."
        format.html { render 'show' }
        format.js  # <-- idem
      end
    end
  end

  private

  # PRELOAD METHODS

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_player
    @player = Player.find_by(user_id: current_user.id, team_id: @team.id)
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


  # FOR EDIT AND UPDATE !!!

  def set_top_and_flop
    @top = current_user.tops.last
    authorize @top
    @flop = current_user.flops.last
    authorize @flop
  end

end
