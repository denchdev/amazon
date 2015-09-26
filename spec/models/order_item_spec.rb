require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item){FactoryGirl.create :order_item}
   
  context "column existence" do
    it{ expect(order_item).to have_db_column(:price)}
    it{ expect(order_item).to have_db_column(:quantity)}

    it{ expect(order_item).to have_db_index(:book_id)}
    it{ expect(order_item).to have_db_index(:order_id)}
  end
  
  context "validations" do
    it{ expect(order_item).to validate_presence_of(:price) }  
    it{ expect(order_item).to validate_presence_of(:quantity) } 
  end
  
  context "associations" do
    it{ expect(order_item).to belong_to(:orders) }
    it{ expect(order_item).to belong_to(:books) }
  end

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
