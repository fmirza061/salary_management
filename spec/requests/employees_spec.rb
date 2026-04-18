require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:employee) do
    Employee.create!(
      full_name: "John Doe",
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )
  end

  it "gets index" do
    get employees_path
    expect(response).to have_http_status(:ok)
  end

  it "creates employee" do
    post employees_path, params: {
      employee: {
        full_name: "Jane Doe",
        job_title: "Manager",
        country: "USA",
        salary: 80000
      }
    }

    expect(response).to redirect_to(employees_path)
  end

  it "shows employee" do
    get employee_path(employee)
    expect(response).to have_http_status(:ok)
  end

  it "updates employee" do
    patch employee_path(employee), params: {
      employee: { salary: 60000 }
    }

    expect(response).to redirect_to(employees_path)
  end

  it "deletes employee" do
    delete employee_path(employee)
    expect(response).to redirect_to(employees_path)
  end
end
