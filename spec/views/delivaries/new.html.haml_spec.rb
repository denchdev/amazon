require 'rails_helper'

RSpec.describe "delivaries/new", type: :view do
  before(:each) do
    assign(:delivary, Delivary.new(
      :name => "MyString",
      :price => 1.5
    ))
  end

  it "renders new delivary form" do
    render

    assert_select "form[action=?][method=?]", delivaries_path, "post" do

      assert_select "input#delivary_name[name=?]", "delivary[name]"

      assert_select "input#delivary_price[name=?]", "delivary[price]"
    end
  end
end
