class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.references :patient, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
