class Post < ApplicationRecord
    validates :image, presence: true
    validates :description, presence: true, length: {maximum: 20} 
    belongs_to :user 
    has_one_attached :image
end
