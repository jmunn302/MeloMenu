class MenuPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
    # record: the menu passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    true
  end

end
