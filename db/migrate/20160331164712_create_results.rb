class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :user, index: true
      t.belongs_to :personality, index: true
      t.boolean :own_result
      t.integer :friend_rate

      t.timestamps null: false
    end
  end
end


