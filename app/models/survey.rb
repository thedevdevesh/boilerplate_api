class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :title, presence: true
  accepts_nested_attributes_for :questions
end
