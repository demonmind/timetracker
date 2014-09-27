class EmployeeController < ApplicationController
	
  def sign_in
  end

  def dashboard
  	if params[:emp_id].present?
      @user = Employee.find_by_uid(params[:emp_id])
      if @user
        @user.timerecords.create(date: Date.today, employee_id: @user.id, in_time: Time.now) unless clocked_in @user
        render 'clockin'
        if @user.emp_type == "admin"
          @allemp = Employee.all
        end
      else
        flash[:notice] = "Employee not found!"
        redirect_to employee_sign_in_path
      end
  	else
  		redirect_to employee_sign_in_path
  	end
  end

  def clock_out
    if params[:emp_id]
      @user = Employee.find_by_uid(params[:emp_id])
      @user.timerecords.last.update_attributes(out_time: Time.now)
      flash[:notice] = "#{@user.fname} clocked out successfuly!"
      redirect_to employee_sign_in_path
    end
  end

  def createemployee
    if params[:employee]
      Employee.create(empparams)
    end
  end

  private

  def clocked_in user
    if user.timerecords.last && user.timerecords.last.in_time.present? && user.timerecords.last.out_time.blank?
      true
    else
      false
    end
  end

  def empparams
    params.require(:employee).permit(:uid, :fname, :lname, :emp_type)
  end
end
