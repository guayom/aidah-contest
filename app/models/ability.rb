class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :manage, Jury
      can :manage, Category
    elsif user.is? :jury
      can :manage, Jury
      can :manage, ParticipantRating
    end

  end
end
