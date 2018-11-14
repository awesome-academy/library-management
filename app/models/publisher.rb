class Publisher < ApplicationRecord
  has_many :books, dependent: :nullify
  validates :name, uniqueness: true, presence: true
  before_destroy {books.update(publisher_id: nil)}
  scope :order_by_created_at_desc, -> {order created_at: :desc}
end
