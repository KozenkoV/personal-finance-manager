class Transaction < ApplicationRecord
    belongs_to :category

    scope :by_transaction_type, ->(transaction_type) do
        Transaction.where(transaction_type: transaction_type)
    end

    scope :by_category_id, ->(category_id) do
        Transaction.where(category_id: category_id)
    end

    scope :created_in_time_slot, ->(started_at, finished_at) do
        Transaction.where(
            Transaction.arel_table[:created_at].gt(started_at).or(
                Transaction.arel_table[:created_at].lteq(finished_at))
        )
    end
end
