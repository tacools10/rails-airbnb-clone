class AddTimeToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :time, :time
  end
end
