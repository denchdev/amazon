class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  validates_presence_of :price, :quantity 
  
  #validate :stocked?
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  before_save :count_price  

  def count_price
    self.price = (book.price * quantity).to_f
  end

  def change_quantity quantity
    self.quantity += quantity.to_i
    save
  end

  def add_to_order(book, quantity, order)
    if Order.find(order).order_items.where('book_id = ?', book).empty? 
      self.update( book_id: book, quantity: quantity, order_id: order.to_i)
    else
      OrderItem.find_by(order_id: order.to_i, book_id: book).change_quantity(quantity)
    end
  end
  
  private  
  def stocked?
    errors.add(:book, 'not in stock!') if book.stock.to_i < quantity.to_i
  end      
end
