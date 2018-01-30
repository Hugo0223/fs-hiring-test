class MotelPolicy < ApplicationPolicy
  def show?
  	user == record.user 
  end
end
