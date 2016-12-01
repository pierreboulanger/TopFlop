class TopController < ApplicationController
  before_action :set_team, :set_game, :set_flop

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
  end

  private

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
    params.require(:top).permit(:game_id, :user_id, :comment)
  end
end
