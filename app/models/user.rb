class User < ActiveRecord::Base
  attr_accessible :display_name, :email, :first_name, :hashed_password, :last_name, :user_level, :username
  has_many :posts, foreign_key:'author_id',:order=> 'created_at ASC'
  has_many :recent_posts, class_name: 'Post' ,:order=> 'created_at ASC',limit: 5
  def full_name
  	"#{first_name} #{last_name}"

  end



end
