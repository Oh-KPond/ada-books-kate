class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres

  validates :title, presence: true
  validates :title, length: { in: 1..25 }
end
