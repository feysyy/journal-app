class Task < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5}, uniqueness: true

  belongs_to :category
  belongs_to :user
end