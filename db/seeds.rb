first_names = ["John", "Jane", "Alex", "Chris", "Sam"]
last_names = ["Smith", "Doe", "Brown", "Taylor"]

countries = ["India", "USA", "UK"]
job_titles = ["Engineer", "Manager", "HR"]

employees = []

10_000.times do
  employees << {
    full_name: "#{first_names.sample} #{last_names.sample}",
    job_title: job_titles.sample,
    country: countries.sample,
    salary: rand(30000..150000),
    created_at: Time.now,
    updated_at: Time.now
  }
end

Employee.insert_all(employees)
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
