module Admin::StatisticHelper
  def book_in_library
    borrowed = Borrow.joins(:books).where(status: 1).group(:status).count
    if borrowed.present?
      in_library = Book.count - borrowed["accept"]
      return unless in_library.present?
    else
      in_library = Book.count
      return unless in_library.present?
    end
    {"Borrowed" => borrowed["accept"],
      "In library" => in_library}
  end
end
