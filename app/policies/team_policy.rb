class TeamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show?
    user.teams.each do |team|
      return record == team
    end
  end

  def update?
    true
  end
end
