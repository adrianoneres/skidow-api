class TransactionSerializer < ActiveModel::Serializer
  attributes :value, :source, :description, :created_at

  belongs_to :account
end
