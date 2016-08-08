require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :latitude => 1.5,
      :longitude => 1.5,
      :name => "MyString",
      :address => "MyString",
      :more_info => "MyString",
      :age => ""
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_address[name=?]", "customer[address]"

      assert_select "input#customer_more_info[name=?]", "customer[more_info]"

      assert_select "input#customer_age[name=?]", "customer[age]"
    end
  end
end
