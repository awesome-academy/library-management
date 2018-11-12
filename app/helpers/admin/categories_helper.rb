module Admin::CategoriesHelper
  def select_parent ignore
    list_parent = Category.parent_all ignore
    list_parent.collect {|p| [p.name, p.id]}
  end
end
