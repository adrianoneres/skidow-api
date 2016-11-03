class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  def balance
    balance = 0.0
    transactions.each do |transaction|
      balance += transaction.value
    end
    ActionController::Base.helpers.number_to_currency(balance, precision: 2, unit: 'U$ ')
  end
end
