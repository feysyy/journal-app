class Category < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5}

  has_many :tasks, dependent: :destroy
  belongs_to :user
end