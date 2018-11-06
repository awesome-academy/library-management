class CreateBorrowBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :borrow_books do |t|
      t.references :borrow, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
