class Employee < ApplicationRecord
  validates :full_name, :job_title, :country, :salary, presence: true

  scope :by_country, ->(country) { where(country: country) }
  scope :by_job_title, ->(title) { where(job_title: title) }
end
