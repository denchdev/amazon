require 'rails_helper'

RSpec.describe "deliveries/edit", type: :view do
  before(:each) do
    @delivery = assign(:delivery, Delivery.create!(
      :name => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit delivery form" do
    render

    assert_select "form[action=?][method=?]", delivery_path(@delivery), "post" do

      assert_select "input#delivery_name[name=?]", "delivery[name]"

      assert_select "input#delivery_price[name=?]", "delivery[price]"
    end
  end
end
