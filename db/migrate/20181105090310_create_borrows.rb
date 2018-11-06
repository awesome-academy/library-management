class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.date :from
      t.date :to
      t.integer :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
