require 'rails_helper'

RSpec.describe "delivaries/show", type: :view do
  before(:each) do
    @delivary = assign(:delivary, Delivary.create!(
      :name => "Name",
      :price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1.5/)
  end
end
