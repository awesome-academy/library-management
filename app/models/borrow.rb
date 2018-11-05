class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_books
end
