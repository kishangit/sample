class AddAcceptedToAppointment < ActiveRecord::Migration[5.2]
  def change
  	add_column :appointments, :accepted, :boolean, default: false
  	add_column :appointments, :accepted_by, :string
  end
end
