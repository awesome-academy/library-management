class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_books, dependent: :destroy
  has_many :book, through: :borrow_books
end
