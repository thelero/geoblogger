class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :comment_text, :user_id, :post_id
  validates_numericality_of :user_id, :post_id,
                            :only_integer => true,
                            :greater_than => 0
end