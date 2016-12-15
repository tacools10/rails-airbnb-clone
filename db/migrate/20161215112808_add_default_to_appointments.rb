class AddDefaultToAppointments < ActiveRecord::Migration[5.0]
  def change
    change_column_default :appointments, :status, from: nil, to: "pending"
  end
end
