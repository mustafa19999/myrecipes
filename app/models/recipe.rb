class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 5, maximum: 500 }
    belongs_to :chef
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
end