class Api::V1::TeamsController < Api::V1::BaseController
  before_action :set_team, only: [ :show ]


  def index
    params[:search].blank? ? @teams = policy_scope(Team) : @teams = policy_scope(Team).where('name ILIKE ?', "%#{params[:search]}%")
  end

  def show
  end

  private

  def set_team
    @team = Team.find(params[:id])
    authorize @team
  end

end
