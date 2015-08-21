require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :total_price => "9.99",
        :state => "State"
      ),
      Order.create!(
        :total_price => "9.99",
        :state => "State"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
