class Dish < ApplicationRecord
  belongs_to :menu
  validates :dietary_type, inclusion: { in: %w(Vegan Vegetarian Gluten-Free Lactose-Free)}
end
