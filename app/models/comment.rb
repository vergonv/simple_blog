class Comment < ActiveRecord::Base
  attr_accessible :author, :author_email, :context, :post_id, :status, :content
  belongs_to :post , :counter_cache => true
end
