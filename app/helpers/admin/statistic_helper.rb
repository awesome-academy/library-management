module Admin::StatisticHelper
  def book_in_library
    borrowed = Borrow.joins(:books).where(status: 1).group(:status).count
    in_library = Book.count - borrowed["accept"]
    {"Borrowed" => borrowed["accept"],
      "In library" => in_library}
  end
end
