class CreatePersonalitiesUsers < ActiveRecord::Migration
  def change
    create_table :personalities_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :personality, index: true
    end
  end
end


