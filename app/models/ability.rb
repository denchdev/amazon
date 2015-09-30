class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new

    if customer.is_a? Admin
      can :manage, :all
    else
      can [:read, :home], Book
      can :read, Author
      can :read, Category
      can :read, Rating, state: "approved" 
      can :read, Delivery
      can :read, Order, customer_id: customer.id
      #can :read, Order_item, order_id: order.id
      unless customer.is_a? Customer        
        can :create, Rating, customer_id: customer.id
        can :read, Address, customer_id: customer.id
      end
    end
  end
end
