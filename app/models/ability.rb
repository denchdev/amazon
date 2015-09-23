class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Customer.new

    if user.is_a? Admin
      can :manage, :all
    else
      can [:read, :add_to_cart], Book
      can :read, Author
      can :read, Category
      can :read, Rating, state: "approved" 
      can :read, Delivery
      can :read, Order, customer_id: customer.id
      can :read, Order_item, customer_id: customer.id
      unless user.is_a? Customer
        can [:read, :create], WishList, user_id: user.id
        can :create, Rating, user_id: user.id
        can :read, Address, user_id: user.id
      end
  end
end
