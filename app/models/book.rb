class Book < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, optional: true
  belongs_to :publisher, optional: true
  has_many :borrow_books, dependent: :destroy
  has_many :borrow, through: :borrow_books
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :image, PictureUploader
  validates :page_number, numericality: { only_integer: true, other_than: 0 }
  validate  :picture_size
  scope :order_by_created_at_desc, -> {order created_at: :desc}
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :publisher

  def self.to_csv books
    require "csv"
    CSV.generate do |csv|
      csv << column_names
      books.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end

  private

  def picture_size
    if image.size > Settings.constant.max_size_image.megabytes
      errors.add :image, t("book.image_too_large")
    end
  end
end
