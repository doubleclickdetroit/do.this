class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, to: :crud

    can :crud, Entity, user_id: user.id
    can [:read, :update], Entity do |entity|
      entity && entity.relationships.where(user_id: user.id).present?
    end
  end
end
