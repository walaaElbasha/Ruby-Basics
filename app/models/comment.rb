class Comment < ApplicationRecord
  belongs_to :article

  validates :body, presence: true,
  length: { minimum: 5 }

  validates :commenter, presence: true,
  length: { minimum: 5 }
end
