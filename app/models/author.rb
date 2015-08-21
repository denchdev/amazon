class Author < ActiveRecord::Base
  has_many :books

  validates_presence_of :firstname, :lastname  
  
  def full_name
    firstname + " " + lastname
  end
    
  def authored
    return "by #{firstname} #{lastname}"
  end
end
