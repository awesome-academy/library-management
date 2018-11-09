class Author < ApplicationRecord
  has_many :books, dependent: :nullify
  has_many :follows, as: :followable
  validates :name, uniqueness: true, presence: true
  before_destroy {books.update(author_id: nil)}
end
