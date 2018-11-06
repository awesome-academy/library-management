class Author < ApplicationRecord
  has_many :books
  has_many :follows, as: :followable
end
