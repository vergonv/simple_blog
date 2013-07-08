class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id,default:0,null:false
      t.string :title ,limit:100,default:"",null:false
      t.text   :content,limit:100,default:"",null:false
      t.string :category,limit:100,default:"",null:false
      t.string :status,limit:100,default:"",null:false

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
