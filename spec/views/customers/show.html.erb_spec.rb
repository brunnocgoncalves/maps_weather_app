require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :latitude => 2.5,
      :longitude => 3.5,
      :name => "Name",
      :address => "Address",
      :more_info => "More Info",
      :age => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/More Info/)
    expect(rendered).to match(//)
  end
end
