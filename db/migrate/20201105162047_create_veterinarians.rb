class CreateVeterinarians < ActiveRecord::Migration[6.0]
  def change
    create_table :veterinarians do |t|
      t.string :name
      t.string :phone_number
      t.string :specializations

      t.timestamps
    end
  end
end
