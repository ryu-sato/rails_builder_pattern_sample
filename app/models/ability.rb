# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # 全ての権限を剥奪
    cannot :manage, :all

    if user.has_role?(:guest)
      can :read, :all
      cannot :manage, User
      cannot :manage, ActiveAdmin::Page
    end

    if user.has_role?(:user)
      can :manage, :all
      cannot :manage, User
      cannot :manage, Role
      cannot :manage, ActiveAdmin::Page
    end

    if user.has_role?(:admin)
      can :manage, :all
      # 外部ユーザは新規作成・編集不可(認証時に自動作成されるため)
      cannot :create, User.externals
      cannot :update, User.externals
    end
  end
end
