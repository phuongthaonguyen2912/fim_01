class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :manage, [User, Artist, Category, Lyric]
    else
      can [:read, :create], Lyric
    end
  end
end
