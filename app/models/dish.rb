class Dish < ApplicationRecord
  belongs_to :menu
  validates :dietary_type, inclusion: { in: %w(vegan vegetarian gluten-free lactose-free)}
end
