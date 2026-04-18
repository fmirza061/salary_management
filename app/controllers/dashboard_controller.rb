class DashboardController < ApplicationController
  def index
    @employees = Employee.limit(10)
  end
end
