class Question < ApplicationRecord
  has_many :answers
  validates :name, presence: true, length: {minimum: 20}
  validates :description, presence: true, length: {minimum: 50}
end
