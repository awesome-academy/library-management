class Borrow < ApplicationRecord
  belongs_to :user
  has_many :borrow_books, dependent: :destroy
  has_many :books, through: :borrow_books
  enum status: %i(waiting accept reject returned)
  delegate :username, to: :user, prefix: true

  def self.to_csv borrows
    require "csv"
    CSV.generate do |csv|
      csv << column_names
      borrows.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
