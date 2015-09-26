require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book){FactoryGirl.create :book}
  
  context "column existence" do
    it{ expect(book).to have_db_column(:title)}
    it{ expect(book).to have_db_column(:description)}
    it{ expect(book).to have_db_column(:stock)}
    it{ expect(book).to have_db_column(:author_id)}
    it{ expect(book).to have_db_column(:category_id)}
    
    it{ expect(book).to have_db_index(:author_id)}
    it{ expect(book).to have_db_index(:category_id)}
  end

  context "validations" do  
    it{ expect(book).to validate_presence_of(:title) }  
    it{ expect(book).to validate_presence_of(:price) }  
    it{ expect(book).to validate_presence_of(:stock) }
  end

  context "associations" do
    it{ expect(book).to belong_to(:category) }
    it{ expect(book).to belong_to(:author) }
    it{ expect(book).to have_many(:ratings) }
  end

  describe "#short_description" do
    it "returns 300 first simbols of description" do
      expect(book.short_description).to eq book.description[0, 300]
    end
  end
  
end
