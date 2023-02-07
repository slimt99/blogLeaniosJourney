module Api 
  class ArticleSerializer < ActiveModel::Serializer
    attributes :title, :body, :status,:published_on_Leanios
  end
end 