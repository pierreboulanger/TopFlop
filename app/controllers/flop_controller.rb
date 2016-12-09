class FlopController < ApplicationController
  before_action :set_team, :set_game
  before_action :set_flop, only: [:edit, :update]

  def new
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "=> controller : flop, action: new"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @flop = Flop.new
  end

  def create
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "=> controller : flop, action: create"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    @flop = Flop.new(flop_params)
    if @flop.save
      respond_to do |format|
        flash[:notice] = "Merci pour ton vote !!"
        format.html { team_game_path(@team, @game) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
    if @flop.update(flop_params)
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

  def set_team
    @team = Team.find(current_user.team_id)
  end

  def set_game
    @game = Game.find(params["game_id"])
  end

  def flop_params
    params.require(:flop).permit(:game_id, :user_id, :flopplayer, :comment)
  end

  def set_flop
    @flop = current_user.flops.last
  end
end
