class Post < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :categories
    
  NO_CATEGORIES = "None"
  
  def self.posts_and_comments
    find(:all, :conditions => {:published => true}, :include => [:comments])
  end
  
  def has_category?(category)
    category_ids.include? category.id
  end
  
  def remove_categories
    
  end

  def categories_s(sep = ", ")
    if categories.empty?
      NO_CATEGORIES
    else
      categories.pluck(:title).join(sep)
    end
  end
end
