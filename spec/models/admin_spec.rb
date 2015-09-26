require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin){FactoryGirl.create :admin}

  context "column existence" do
    it{ expect(admin).to have_db_column(:email)}   
    it{ expect(admin).to have_db_column(:encrypted_password)}
  end  
  
  context "validations" do   
    it{ expect(admin).to validate_presence_of(:email) }
    #it{ expect(admin).to validate_presence_of(:encrypted_password) }    
  end 
end
