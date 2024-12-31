class Chapter < ApplicationRecord
  validates :index, presence: true
  belongs_to :book
  has_one :note
end
