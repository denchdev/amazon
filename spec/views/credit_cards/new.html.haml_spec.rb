require 'rails_helper'

RSpec.describe "credit_cards/new", type: :view do
  before(:each) do
    assign(:credit_card, CreditCard.new(
      :number => "MyString",
      :CVV => "MyString",
      :expiration_month => "MyString",
      :expiration_year => "MyString",
      :firstname => "MyString",
      :lastname => "MyString"
    ))
  end

  it "renders new credit_card form" do
    render

    assert_select "form[action=?][method=?]", credit_cards_path, "post" do

      assert_select "input#credit_card_number[name=?]", "credit_card[number]"

      assert_select "input#credit_card_CVV[name=?]", "credit_card[CVV]"

      assert_select "input#credit_card_expiration_month[name=?]", "credit_card[expiration_month]"

      assert_select "input#credit_card_expiration_year[name=?]", "credit_card[expiration_year]"

      assert_select "input#credit_card_firstname[name=?]", "credit_card[firstname]"

      assert_select "input#credit_card_lastname[name=?]", "credit_card[lastname]"
    end
  end
end
