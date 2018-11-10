class Book < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, optional: true
  belongs_to :publisher, optional: true
  has_many :borrow_books
  has_many :rates
  has_many :comments
  has_many :likes
end
