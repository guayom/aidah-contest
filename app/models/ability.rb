class Ability
  include CanCan::Ability

  # User::Roles
  # The available roles
  Roles = [ :admin, :jury, :participant, :default ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def initialize(user)
    user ||= User.new

    # if user.is? :admin
    #   can :manage, Jury
    # else
    #   can :read, Article
    # end
  end
end
