class Api::V1::TeamsController < Api::V1::BaseController
  def index
    @teams = policy_scope(Team)
  end
end
