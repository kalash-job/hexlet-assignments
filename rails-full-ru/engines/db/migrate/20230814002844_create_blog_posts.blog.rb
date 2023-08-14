# This migration comes from blog (originally 20230814001603)
class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end