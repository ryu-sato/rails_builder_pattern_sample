# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # 自分自身は manage 可能
    can :manage, user

    if user.has_role?(:guest)
      cannot :manage, User
      cannot :manage, Role
      can :read, :all
    end

    if user.has_role?(:user)
      cannot :manage, User
      cannot :manage, Role
      can :manage, :all
    end

    if user.has_role?(:admin)
      can :manage, :all
    end
  end
end
