class Image < ApplicationRecord
  belongs_to :user
  has_many :image_tags, dependent: :delete_all
  has_many :tags, through: :image_tags
end
