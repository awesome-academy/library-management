class Category < ApplicationRecord
  has_many :subcategories, :class_name => Category.name,
    :foreign_key => :parent_id, :dependent => :destroy
  has_one :_parent, :class_name => Category.name, :foreign_key => :id
end
