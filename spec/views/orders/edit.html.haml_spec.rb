require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :total_price => "9.99",
      :state => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_total_price[name=?]", "order[total_price]"

      assert_select "input#order_state[name=?]", "order[state]"
    end
  end
end
