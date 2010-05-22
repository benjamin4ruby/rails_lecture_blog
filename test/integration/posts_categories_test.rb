require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  def setup
    login    
  end
  
  def teardown
    logout
  end

  test "should update categories-post-relationships add categories" do
    new_category_ids = posts(:with_categories).category_ids + [ categories(:number17).id ]
    
    put :update, :id => posts(:with_categories).to_param, :post => { :category_ids => new_category_ids }
    
    p = Post.find posts(:with_categories).id
    assert_equal new_category_ids, p.category_ids 
  end
  
  test "should update categories-post-relationships add categories for the first time" do
    new_category_ids = [ categories(:number17).id, categories(:number18).id ]
    
    put :update, :id => posts(:without_categories).to_param, :post => { :category_ids => new_category_ids }
    
    p = Post.find posts(:without_categories).id
    assert_equal new_category_ids, p.category_ids 
  end

  test "should update categories-post-relationships remove categories" do
    new_category_ids = posts(:with_categories).category_ids - [ categories(:two).id ]
    
    put :update, :id => posts(:with_categories).to_param, :post => { :category_ids => new_category_ids }
    
    p = Post.find posts(:with_categories).id
    assert_equal new_category_ids, p.category_ids 
  end

  test "should update categories-post-relationships remove all categories" do
    new_category_ids = []
    
    put :update, :id => posts(:with_categories).to_param, :post => { }
    
    p = Post.find posts(:with_categories).id
    assert_equal new_category_ids, p.category_ids 
  end

end