require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating){FactoryGirl.create :rating}
  
  context "column existence" do
    it{ expect(rating).to have_db_column(:review)}
    it{ expect(rating).to have_db_column(:rating)}
    it{ expect(rating).to have_db_column(:customer_id)}
    it{ expect(rating).to have_db_column(:book_id)}
    
    it{ expect(rating).to have_db_index(:customer_id)}
    it{ expect(rating).to have_db_index(:book_id)}
  end

  context "associations" do
    it{ expect(rating).to belong_to(:customer) }
  it{ expect(rating).to belong_to(:book) }
  end

  context "validations" do
    it{ expect(rating).to validate_inclusion_of(:rating) }  
  end

  describe "#already_rated?" do
    let(:book){FactoryGirl.create :book}
    it "check book on a rating" do
      #expect(rating.already_rated?).to eq book.description[0, 300]
    end
  end

  describe "#calculate_book_avg_rating" do
    let(:book){FactoryGirl.create :book}
    it "returns the average rating of the book" do
      #expect(rating.calculate_book_avg_rating).to eq book.description[0, 300]
    end
  end
end
