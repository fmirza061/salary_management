require 'rails_helper'

RSpec.describe SalaryInsightsService do
  let!(:emp1) do
    Employee.create!(
      full_name: "A",
      job_title: "Engineer",
      country: "India",
      salary: 50000
    )
  end

  let!(:emp2) do
    Employee.create!(
      full_name: "B",
      job_title: "Engineer",
      country: "India",
      salary: 70000
    )
  end

  it "calculates country stats" do
    service = SalaryInsightsService.new

    puts "TEST DATA: #{Employee.all.inspect}"   # 👈 debug

    stats = service.country_stats("India")

    expect(stats[:min]).to eq(50000)
    expect(stats[:max]).to eq(70000)
  end

  it "calculates avg salary by job" do
    service = SalaryInsightsService.new
    avg = service.avg_salary_by_job("India", "Engineer")

    expect(avg).to eq(60000.0)
  end
end
