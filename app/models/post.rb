class Post < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :yomitais, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    def yomitaid_by?(user)
        yomitais.where(user_id: user.id).exists?
    end
end
