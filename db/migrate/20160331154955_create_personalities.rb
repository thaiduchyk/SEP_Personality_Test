class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.string :name
      t.text :description
      t.string :key

      t.timestamps null: false
    end
  end
end
