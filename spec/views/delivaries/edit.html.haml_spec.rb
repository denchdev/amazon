require 'rails_helper'

RSpec.describe "delivaries/edit", type: :view do
  before(:each) do
    @delivary = assign(:delivary, Delivary.create!(
      :name => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit delivary form" do
    render

    assert_select "form[action=?][method=?]", delivary_path(@delivary), "post" do

      assert_select "input#delivary_name[name=?]", "delivary[name]"

      assert_select "input#delivary_price[name=?]", "delivary[price]"
    end
  end
end
