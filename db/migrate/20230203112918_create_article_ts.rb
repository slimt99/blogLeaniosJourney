class CreateArticleTs < ActiveRecord::Migration[6.0]
  def change
    create_table :article_ts do |t|

      t.timestamps
    end
  end
end
