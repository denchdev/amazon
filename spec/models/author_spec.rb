require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author){FactoryGirl.create :author}
  
  context "column existence" do
    it{ expect(author).to have_db_column(:firstname)}
    it{ expect(author).to have_db_column(:lastname)}
    it{ expect(author).to have_db_column(:biography)}
  end
  
  context "validations" do
    it{ expect(author).to validate_presence_of(:firstname) }
    it{ expect(author).to validate_presence_of(:lastname) }
  end
  
  context "associations" do
    it{ expect(author).to have_many(:books) }
  end

  describe "#full_name" do
    it "returns first_name + last_name" do
      expect(author.full_name).to eq "#{author.firstname} #{author.lastname}"
    end
  end

  describe "#authored" do
    it "returns by + first_name + last_name" do
      expect(author.authored).to eq "by #{author.firstname} #{author.lastname}"
    end
  end


end
