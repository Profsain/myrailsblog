class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin' # user is an admin
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
    end

    # # user can delete posts if they are the author
    # can :manage, Post, user_id: user.id

    # # user can delete post if they are an admin
    # # can :manage, Post, user_id: user.id if user.admin?

    # # user can delete comments if they are the author
    # can :manage, Comment, user_id: user.id

    # user can delete comments if they are an admin
    # can :manage, Comment, user_id: user.id if user.admin?

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
