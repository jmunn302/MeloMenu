class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all # If users can see all restaurants
      scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
    end
  end

  def show?
      true
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
