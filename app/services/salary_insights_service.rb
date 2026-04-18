class SalaryInsightsService
  def initialize(scope = Employee.all)
    @scope = scope
  end

def country_stats(country)
  data = @scope.where("LOWER(country) = ?", country.downcase)

  puts "DEBUG DATA: #{data.inspect}"

  {
    min: data.minimum(:salary),
    max: data.maximum(:salary),
    avg: data.average(:salary)&.round(2),
    count: data.count
  }
end

  # Avg salary for job title in a country
  def avg_salary_by_job(country, job_title)
    @scope.where(country: country, job_title: job_title)
          .average(:salary)
          &.round(2)
  end

  # Top earners
  def top_earners(limit = 5)
    @scope.order(salary: :desc).limit(limit)
  end

  # Salary distribution by country (for charts)
  def avg_salary_per_country
    @scope.group(:country).average(:salary)
  end

  # Count employees per country
  def employees_per_country
    @scope.group(:country).count
  end
end
