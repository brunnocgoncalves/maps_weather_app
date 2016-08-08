require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :name => "Name",
        :address => "Address",
        :more_info => "More Info",
        :age => ""
      ),
      Customer.create!(
        :latitude => 2.5,
        :longitude => 3.5,
        :name => "Name",
        :address => "Address",
        :more_info => "More Info",
        :age => ""
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "More Info".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
