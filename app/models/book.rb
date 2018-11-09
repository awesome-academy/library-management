class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  belongs_to :publisher, optional: true
  has_many :borrow_books
  has_many :rates
  has_many :comments
  has_many :likes
end
