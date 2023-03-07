class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :template
  has_many :dishes
end
