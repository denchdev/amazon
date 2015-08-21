require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :biography => "Biography"
      ),
      Author.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :biography => "Biography"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Biography".to_s, :count => 2
  end
end
