class Post < ActiveRecord::Base
  #set_table_name :blog_posts
  attr_accessible :author_id, :catagory, :content,:created_at,:status, :title, :comments_count,:category_ids
  belongs_to :author, class_name: 'User' ,foreign_key: 'author_id'
  has_many :comments, order:'created_at ASC', dependent: :destroy
  has_many :categorization
  has_many :categories, through: :categorization
  validates_presence_of :title
end
