class CreateHeadwords < ActiveRecord::Migration[5.1]
  def change
    create_table :head_words do |t|
      t.string :name

      t.timestamps
    end
  end
end
