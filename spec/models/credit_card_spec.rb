require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  # let(:credit_card){FactoryGirl.create :credit_card}
  
  # context "column existence" do
  #   it{ expect(credit_card).to have_db_column(:number)}
  #   it{ expect(credit_card).to have_db_column(:CVV)}
  #   it{ expect(credit_card).to have_db_column(:expiration_month)}
  #   it{ expect(credit_card).to have_db_column(:expiration_year)}    
  #   it{ expect(credit_card).to have_db_column(:firstname)}
  #   it{ expect(credit_card).to have_db_column(:lastname)}    
  # end
  
  # context "validations" do
  #   it{ expect(credit_card).to validate_presence_of(:number) }
  #   it{ expect(credit_card).to validate_presence_of(:CVV) }
  #   it{ expect(credit_card).to validate_presence_of(:expiration_month) }
  #   it{ expect(credit_card).to validate_presence_of(:expiration_year) }
  #   it{ expect(credit_card).to validate_presence_of(:firstname) }
  #   it{ expect(credit_card).to validate_presence_of(:lastname) }
  # end
 
  # context "associations" do
  #   it{ expect(author).to have_many(:books) }
  # end

  # describe "#full_name" do
  #   it "returns first_name + last_name" do
  #     expect(author.full_name).to eq "#{author.firstname} #{author.lastname}"
  #   end
  # end

  # describe "#authored" do
  #   it "returns by + first_name + last_name" do
  #     expect(author.authored).to eq "by #{author.firstname} #{author.lastname}"
  #   end
  # end

end
