require 'rails_helper'

RSpec.describe "ratings/index", type: :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :rewiev => "Rewiev",
        :rating => 1
      ),
      Rating.create!(
        :rewiev => "Rewiev",
        :rating => 1
      )
    ])
  end

  it "renders a list of ratings" do
    render
    assert_select "tr>td", :text => "Rewiev".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
