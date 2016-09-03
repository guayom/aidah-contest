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
    else
      can [:update, :destroy], Participant, :user_id => user.id
    end

  end
end
