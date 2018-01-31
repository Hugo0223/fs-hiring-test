class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(:motel_id => user.motels.map(&:id))
    end
  end

  def show?
  	user == record.motel.user
  end 
end
 
