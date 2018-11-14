module Admin::BooksHelper
  def book_select_author
    Author.select(:id, :name).collect{ |a| [a.name, a.id] }
  end

  def book_select_publisher
    Publisher.select(:id, :name).collect{ |p| [p.name, p.id] }
  end

  def book_select_category
    select_category = Array.new
    Category.parent_only.includes(:subcategories).each do |parent|
      select_category << [parent.name, parent.id]
      unless parent.subcategories.empty?
        parent.subcategories.each do |sub|
          select_category << [". "+sub.name, sub.id]
        end
      end
    end
    select_category
  end
end
