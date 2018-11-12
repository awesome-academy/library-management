class User < ApplicationRecord
  before_save :default_admin
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :borrows
  has_many :follows, as: :followable

  def default_admin
    self.is_admin ||= false
  end

  def self.to_csv users
    require "csv"
    CSV.generate do |csv|
      csv << column_names
      users.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
