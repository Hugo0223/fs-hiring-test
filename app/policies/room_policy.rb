class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
  	user == record.motel.user
  end
end
