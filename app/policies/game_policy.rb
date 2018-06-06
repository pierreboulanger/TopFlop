class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user_belong_to_team?
  end

  def create?
    true
  end

  def update?
    true
  end

  def user_belong_to_team?
    user.teams.each do |team|
      return record.team_id == team.id
    end
  end
end
