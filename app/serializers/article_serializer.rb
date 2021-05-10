class ArticleSerializer < ActiveModel::Serializer
  attributes :id , :title,:text
  has_many:comments

  # def include_author?
  #   current_user.admin?
  # end
  
end
