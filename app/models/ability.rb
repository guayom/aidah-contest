class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.is?
    when :admin
      can :manage, Jury
    when :jury
      can :manage, Jury
      can :manage, ParticipantRating
    end
  end
end
