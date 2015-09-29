class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :minutes
      t.float :rate

      t.timestamps null: false
    end
  end
end
