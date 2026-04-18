class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.order(created_at: :desc).page(params[:page]).per(20)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Employee created"
    else
      render :new
    end
  end

  def edit
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Deleted"
  end

  def insights
    service = SalaryInsightsService.new

    @country = params[:country]
    @job_title = params[:job_title]

    if @country.present?
      @stats = service.country_stats(@country)
    end

    if @country.present? && @job_title.present?
      @job_avg = service.avg_salary_by_job(@country, @job_title)
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:full_name, :job_title, :country, :salary)
  end
end