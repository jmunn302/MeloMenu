class SupportRequest < ApplicationRecord
  validates :name, presence: true
  validates :issue, presence: true
end
