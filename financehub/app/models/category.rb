class Category < ApplicationRecord
    # scope :filter_category_by_user, -> (user_id) { where "user_id = ?", user_id }

    belongs_to :user
    has_many :operations, dependent: :destroy

    validates :name, :description, presence: true
end
