require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :latitude => 1.5,
      :longitude => 1.5,
      :name => "MyString",
      :address => "MyString",
      :more_info => "MyString",
      :age => ""
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "input#customer_more_info[name=?]", "customer[more_info]"

      assert_select "input#customer_age[name=?]", "customer[age]"
    end
  end
end
