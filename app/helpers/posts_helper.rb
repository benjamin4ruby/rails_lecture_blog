module PostsHelper
  def category_active(category)
    cat_id = category.is_a?(Category) ? category.id : category
    @post.category_ids.include? cat_id
  end
end
