class Rating < ActiveRecord::Base
  belongs_to :book
  belongs_to :customer

  validates_inclusion_of :rating, :in => 0..100
  
  belongs_to :customer
  belongs_to :book
  
  after_save :calculate_book_avg_rating

  def already_rated?
    Rating.where(customer_id: customer.id, book_id: book.id).empty?
  end

  def calculate_book_avg_rating
    book.recalculate_avg_rating!
  end
end
