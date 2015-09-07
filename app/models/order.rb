class Order < ActiveRecord::Base
  include AASM

  belongs_to :customer
  belongs_to :credit_card, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :delivery
  belongs_to :billing_address,  class_name: "Address"
  belongs_to :shipping_address, class_name: "Address"
  
  #validates_presence_of :total_price, :state
  #validates_presence_of :completed_date
  
  #before_save :total_price
  
  aasm column: "state" do
    state :in_progress, :initial => true
    state :in_queue
    state :in_delivery
    state :delivered

    event :checkout do
      transitions :from => :in_progress, :to => :in_queue
    end

    event :proceed do
      transitions :from => :in_queue, :to => :in_delivery
    end

    event :complete do
      transitions :from => :in_delivery, :to => :delivered
    end
  end
  
  def total_price
    sum = order_items.map {|item| item.price}.sum
    if delivery_id
      sum = sum + delivery.price
    end
    sum
  end

  def books_price
    sum = order_items.map {|item| item.price}.sum
  end
  
  def count_item
    order_items.map {|item| item.quantity}.sum
  end
end
