class Response < ApplicationRecord
  belongs_to :survey

  validates :user_id, presence: true
  validates :answers, presence: true
end
