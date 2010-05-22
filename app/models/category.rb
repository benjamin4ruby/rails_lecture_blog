class Category < ActiveRecord::Base
   has_and_belongs_to_many :posts
   
   def has_post?(post)
     post_ids.include? post.id
   end
end
