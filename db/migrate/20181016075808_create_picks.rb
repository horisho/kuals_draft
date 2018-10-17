class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.integer :round
      t.string :title
      t.string :name
      t.text :remark
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :picks, [ :user_id, :created_at ]
  end
end
