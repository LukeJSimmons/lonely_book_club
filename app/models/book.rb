class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :author
  accepts_nested_attributes_for :author
  belongs_to :genre
  accepts_nested_attributes_for :genre

  has_one :review, dependent: :destroy
  has_many :chapters, dependent: :destroy

  after_create :create_chapters

  private

    def self.ransackable_attributes(auth_object = nil)
      [ "genre", "title" ]
    end

    def create_chapters
      total_chapters.times do |number|
        chapters.create(index: number+1)
      end
    end
end
