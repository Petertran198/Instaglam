class Post < ApplicationRecord
    validate :image_prescence
    validates :description, length: {maximum: 20} 
    belongs_to :user 
    has_one_attached :image


    def image_prescence
        errors.add(:image, "can't be blank") unless image.attached?
    end
end
