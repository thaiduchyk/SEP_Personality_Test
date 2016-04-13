class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.string :token
      t.boolean :passed, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
