class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, to: :crud

    can :crud, Entity #, user_id: user.id
    # can :create, Entity
    # can [:read, :update], Entity do
    #   entity && entity.has_user?(user)
    # end
    # can :destroy, Entity, user_id: user.id
  end
end
