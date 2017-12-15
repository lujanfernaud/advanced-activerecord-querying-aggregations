class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.maximum_salary_by_location
    joins(:location).group("locations.id").maximum(:salary)
  end

  def self.managers_by_average_salary_difference
    # Haven't been able to make this one work as expected.
    joins(:manager).group("managers_people.name").average(:salary)
  end
end
