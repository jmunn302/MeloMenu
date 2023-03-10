class Menu < ApplicationRecord
  belongs_to :restaurant
  belongs_to :template
  has_many :dishes
  accepts_nested_attributes_for :dishes
end
