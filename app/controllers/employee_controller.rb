class EmployeeController < ApplicationController
	
  def sign_in
  end

  def dashboard
  	if params[:emp_id].present?
      @user = Employee.find_by_uid(params[:emp_id])
      if @user
        session[:emp_id] = @user.uid
        @user.timerecords.create(date: Date.today, employee_id: @user.id, in_time: Time.now) unless clocked_in @user
        if @user.emp_type == "admin"
          @employees = Employee.all
          Rails.logger.debug @employees.inspect
        end
        render 'clockin'
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
      render "clockout"
    end
  end

  def createemployee
    if params[:employee] && request.post?
      @emp = Employee.create(empparams)
      if @emp.id == nil
        flash[:notice] = "Record Failed"
      else
        flash[:notice] = "#{@emp.fname} created successfuly!" 
      end
      redirect_to employee_dashboard_path(:emp_id => session[:emp_id])
    end
  end

  def removeemployee
    @users = Employee.all(:conditions => ["uid != ?", session[:emp_id]])
    if params[:employee] && request.post?
      @emp = Employee.find_by_uid(params[:employee][:emp_id]).destroy
      flash[:notice] = "#{@emp.fname} deleted successfuly!"
      redirect_to employee_dashboard_path(:emp_id => session[:emp_id])
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
