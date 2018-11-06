class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :describe
      t.integer :page_number
      t.string :image
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
