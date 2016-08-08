class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :more_info
      t.integer :age

      t.timestamps null: false
    end
  end
end
