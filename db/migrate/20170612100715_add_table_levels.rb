class AddTableLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :difficulty
    end
  end
end
