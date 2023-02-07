class AddPublishedToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :published_on_Leanios, :boolean
  end
end
