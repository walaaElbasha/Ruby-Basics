
class Article < ApplicationRecord

   #  include ActiveModel::SerializerSupport
   def active_model_serializer
    ArticleSerializer
    end

    

    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                      length: { minimum: 5 }
  end