class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, Admin
    can :read, [Truck, Driver, Route, Cargo, ModelType]
    if user.present?
      can :manage, :all
    end
  end
end
