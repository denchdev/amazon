require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category){FactoryGirl.create :category}
  
  context "column existence" do
    it{ expect(category).to have_db_column(:title)}
  end
  
  context "validations" do
    it{ expect(category).to validate_presence_of(:title) }  
    it{ expect(category).to validate_uniqueness_of(:title) } 
  end
  
  context "associations" do
    it{ expect(category).to have_many(:books) }
  end
end
