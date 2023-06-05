class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    # New Employee Creation
    def create
        @employee = Employee.new(employee_params)
      
        if @employee.save
          redirect_to employees_path, notice: "Employee has been created successfully"
        else
          puts @employee.errors.full_messages # Log error messages to the console
          render :new
        end
    end
    
    # Find existing employee information for edit
    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])

        if @employee.update(employee_params)
            redirect_to employees_path, notice: "Employee information has been updated successfully"
        else
            puts @employee.errors.full_messages
            render :edit
        end
    end

    # View particular employee information
    def show
        @employee = Employee.find(params[:id])
    end

    # Delete particular employee by id 
    def destroy
        @employee = Employee.find(params[:id])
        if @employee.destroy
            redirect_to employees_path, notice: "Employee information has been deleted successfully"
        end
    end

    private

    def employee_params
        params.require(:employee).permit(
            :first_name,
            :last_name,
            :middle_name,
            :personal_email,
            :city,
            :state,
            :country,
            :pincode,
            :address_line_1,
            :address_line_2
        )
    end
      
end

