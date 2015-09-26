class Rating < ActiveRecord::Base
  include AASM
  
  belongs_to :book
  belongs_to :customer

  validates_inclusion_of :rating, :in => 0..10
  
  belongs_to :customer
  belongs_to :book
  
  after_save :calculate_book_avg_rating

  def already_rated?
    Rating.where(customer_id: customer.id, book_id: book.id).empty?
  end

  def calculate_book_avg_rating
    book.recalculate_avg_rating!
  end

  default_scope { order(created_at: :desc) }

  scope :pending, -> { where(state: :pending) }
  scope :approved, -> { where(state: :approved) }

  aasm column: "state" do
    state :pending, :initial => true
    state :approved
    state :rejected    

    event :approve do
      transitions :pending => :approved
    end

    event :reject do
      transitions [:pending, :approved] => :rejected
    end
  end

end
