class Transaction < ApplicationRecord
  belongs_to :account

  validates :value, presence: true
  validates :source, presence: true
end
