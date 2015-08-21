require 'rails_helper'

RSpec.describe "deliveries/new", type: :view do
  before(:each) do
    assign(:delivery, Delivery.new(
      :name => "MyString",
      :price => 1.5
    ))
  end

  it "renders new delivery form" do
    render

    assert_select "form[action=?][method=?]", deliveries_path, "post" do

      assert_select "input#delivery_name[name=?]", "delivery[name]"

      assert_select "input#delivery_price[name=?]", "delivery[price]"
    end
  end
end
