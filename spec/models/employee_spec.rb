require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is valid with valid attributes" do
    emp = Employee.new(
      full_name: "John Doe",
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )
    expect(emp).to be_valid
  end

  it "is invalid without name" do
    emp = Employee.new(job_title: "Engineer", country: "India", salary: 50000)
    expect(emp).not_to be_valid
  end

  it "is invalid without salary" do
    emp = Employee.new(full_name: "John", job_title: "Engineer", country: "India")
    expect(emp).not_to be_valid
  end
end