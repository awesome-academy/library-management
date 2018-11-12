module Admin::BooksHelper
  def book_select_author
    Author.select(:id, :name).collect{ |a| [a.name, a.id] }
  end

  def book_select_publisher
    Publisher.select(:id, :name).collect{ |p| [p.name, p.id] }
  end

  def book_select_category
    Category.select(:id, :name).collect{ |c| [c.name, c.id] }
  end
end
