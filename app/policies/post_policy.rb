class PostPolicy < ApplicationPolicy
  def index?
    true
  end

class Scope 
  attr_reader :user, :scope

  def initialize(user,scope)
    @user = user
    @scope = scope
  end

  def resolve
    # scope.none == scope.where(id: nil)
    return scope.none if user.blank? # ruby gives you object.empty? rails gives you object.blank?
    if user.admin? || user.moderator?
      scope.all
    else
      scope.where(user: user)
    end
  end

end

end

