class Category < ApplicationRecord
  has_many :subcategories, class_name: Category.name,
    foreign_key: :parent, dependent: :destroy
  has_one :parents, class_name: Category.name,
    primary_key: :parent, foreign_key: :id
  has_many :books
  validates :name, uniqueness: true, presence: true
  scope :parent_all, ->(ignore){where(parent: nil).where.not id: ignore}
  scope :parent_only, ->{where parent: nil}
  scope :show_only, ->{select :id, :name, :parent}
end
