require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer){FactoryGirl.create :customer}
  
  context "column existence" do
    it{ expect(customer).to have_db_column(:firstname)}
    it{ expect(customer).to have_db_column(:lastname)}
    it{ expect(customer).to have_db_column(:billing_address_id)}
    it{ expect(customer).to have_db_column(:shipping_address_id)}
    it{ expect(customer).to have_db_column(:email)}
    it{ expect(customer).to have_db_column(:uid)}
    it{ expect(customer).to have_db_column(:provider)}
  end
  
  context "associations" do
    it{ expect(customer).to have_many(:orders) }
    it{ expect(customer).to have_many(:ratings) }    
    it{ expect(customer).to belong_to(:billing_address) }
    it{ expect(customer).to belong_to(:shipping_address) }  
  end

  context "validations" do
    it{ expect(customer).to validate_presence_of(:firstname) }  
  it{ expect(customer).to validate_presence_of(:lastname) }  
  it{ expect(customer).to validate_presence_of(:email) }
  it{ expect(customer).to validate_presence_of(:password) }
  it{ expect(customer).to validate_uniqueness_of(:email) }
  end 
end
