class AccountSerializer < ActiveModel::Serializer
  attributes :balance, :transactions

  belongs_to :user
  has_many :transactions
end
