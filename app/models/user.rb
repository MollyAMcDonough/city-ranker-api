class User < ApplicationRecord
    belongs_to :city
    has_many :user_cities
    has_many :cities, through: :user_cities
    has_many :categories
    validates :sub, presence: true, uniqueness: true
end
