class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :year
      t.string :make
      t.string :model
      t.string :insurance
      t.string :vin
      t.string :license_plate
      t.string :tire_psi
      t.string :registration
      t.string :title
      t.date :inspection_date

      t.timestamps
    end
  end
end
