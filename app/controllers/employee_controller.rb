class EmployeeController < ApplicationController
	
  def sign_in
  end

  def dashboard
  	if params[:emp_id]
  		#Do Stuff
  	else
  		redirect_to employee_sign_in_path
  	end
  end
end
