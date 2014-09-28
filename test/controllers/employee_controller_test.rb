require 'rails_helper'

describe "workflow", :type => :feature do

  it "clock users in" do
    visit "/"
    fill_in "emp_id", :with => "12345"
    click_button "Sign in"

    page.should have_content('Clock Out')
  end

  it "redirects to homepage if user not found" do
    visit "/"
    fill_in "emp_id", :with => "123"
    click_button "Sign in"

    page.should have_content('Sign in')
  end

  it "renders all employee stats if user is admin" do
  	visit "/"
    fill_in "emp_id", :with => "12345"
    click_button "Sign in"

    page.should have_content('All Employees Stats')
  end

  it "renders personal stats if user not an admin" do
  	visit "/"
    fill_in "emp_id", :with => "1234"
    click_button "Sign in"

    page.should have_content('My Stats')
    page.should have_content('John')
  end

  it "should not render all employee stats if employee not admin" do
  	visit "/"
    fill_in "emp_id", :with => "1234"
    click_button "Sign in"

    page.should_not have_content('All Employees Stats')
  end

  it "should add an employee if uid is present" do
  	visit create_path
    fill_in "employee[uid]", :with => "12347"
    fill_in "employee[fname]", :with => "Jack"
    fill_in "employee[lname]", :with => "nick"
    select "Employee", :from => "employee[emp_type]"
    click_button "Create"

    page.should have_content('created successfuly!')
  end

  it "should delete an employee if pressed delete with employee chosen when logged in as admin" do
  	visit "/"
    fill_in "emp_id", :with => "12345"
    click_button "Sign in"
  	visit delete_path
    select "John", :from => "employee[emp_id]"
    click_button "Delete"

    page.should have_content('deleted successfuly!')
  end
end