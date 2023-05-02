class Task < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5}, uniqueness: true
  validates :date, presence: true
  belongs_to :category
  belongs_to :user
end