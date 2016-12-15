class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :asset

  def start_time
    self.date
  end
end
