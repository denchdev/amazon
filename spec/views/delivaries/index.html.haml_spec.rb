require 'rails_helper'

RSpec.describe "delivaries/index", type: :view do
  before(:each) do
    assign(:delivaries, [
      Delivary.create!(
        :name => "Name",
        :price => 1.5
      ),
      Delivary.create!(
        :name => "Name",
        :price => 1.5
      )
    ])
  end

  it "renders a list of delivaries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
