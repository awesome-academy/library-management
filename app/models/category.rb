class Category < ApplicationRecord
  belongs_to :parent, :class_name => Category.name, :foreign_key => "parent_id"
  has_many :child_category, ->(category) { where parent_id: category.id },
    :class_name => Category.name
end
