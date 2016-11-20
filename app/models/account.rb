class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

  def total_balance #used for calcs
    balance = 0.0
    transactions.each do |transaction|
      balance += transaction.value
    end
    balance
  end

  def balance #used for exhibition
    balance = 0.0
    transactions.each do |transaction|
      balance += transaction.value
    end
    ActionController::Base.helpers.number_to_currency(balance, precision: 2, unit: 'U$ ', negative_format: '%u - %n')
  end

  def balance_positive
    balance = 0.0
    transactions.each do |transaction|
      balance += transaction.value
    end
    balance >= 0
  end
end
