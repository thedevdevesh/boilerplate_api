class Question < ApplicationRecord
  belongs_to :survey

  validates :content, presence: true
end
