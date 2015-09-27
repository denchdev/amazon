class Book < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :author
  has_many :ratings, dependent: :destroy 

  validates_presence_of :title, :price, :stock 
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
  
  def short_description
    if description.length < 300
      return description
    else
      desc = description[0, 300] + "..."
      return desc
    end    
  end

  
  
end
