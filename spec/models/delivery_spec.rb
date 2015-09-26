require 'rails_helper'

RSpec.describe Delivery, type: :model do
  let(:delivery){FactoryGirl.create :delivery}
  
  context "column existence" do
    it{ expect(delivery).to have_db_column(:name)}
    it{ expect(delivery).to have_db_column(:price)}   
  end
  
  context "validations" do
    it{ expect(delivery).to validate_presence_of(:name) }
    it{ expect(delivery).to validate_presence_of(:price) }
    it{ expect(delivery).to validate_numericality_of(:price) }    
  end
  
  context "associations" do
    it{ expect(delivery).to have_many(:orders) }
  end
end
