class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user, foreign_key: 'sender_id'

  validates :value, presence: true
  validates :source, presence: true
end
