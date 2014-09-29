require 'rails_helper'

describe "Employee", :type => :feature do

  it "clock users in" do
    clockin_employee_general
    page.should have_content('Clock Out')
  end

  it "redirects to homepage if user not found" do
    visit "/"
    fill_in "emp_id", :with => "123"
    click_button "Sign in"

    page.should have_content('Sign in')
  end

  it "renders all employee stats if user is admin" do
    clockin_employee_admin

    page.should have_content('All Employees Stats')
  end

  it "renders personal stats if user not an admin" do
    clockin_employee_general

    page.should have_content('My Stats')
    page.should have_content('John')
  end

  it "should not render all employee stats if employee not admin" do
    clockin_employee_general

    page.should_not have_content('All Employees Stats')
  end

  it "should not show Add Employee to regular employee" do
    clockin_employee_general

    page.should_not have_content("Add Employee")
  end

  it "should not show Remove Employee to regular employee" do
    clockin_employee_general

    page.should_not have_content("Remove Employes")
  end

  feature "Admin add or remove user" do
     scenario "should add an employee if uid is present" do
       clockin_employee_admin
       click_link "Add Employee"
       fill_in "employee[uid]", :with => "12347"
       fill_in "employee[fname]", :with => "Jack"
       fill_in "employee[lname]", :with => "nick"
       select "Employee", :from => "employee[emp_type]"
       click_button "Create"

       page.should have_content('created successfuly!')
     end

     scenario "should delete an employee if pressed delete with employee chosen when logged in as admin" do
       clockin_employee_admin
       click_link "Remove Employee"
       select "John", :from => "employee[emp_id]"
       click_button "Delete"

        page.should have_content('deleted successfuly!')
      end
  end

  def clockin_employee_admin
    visit root_path
    fill_in 'emp_id', with: 12345
    click_button 'Sign in'
  end

  def clockin_employee_general
    visit root_path
    fill_in 'emp_id', with: 1234
    click_button 'Sign in'
  end
end
