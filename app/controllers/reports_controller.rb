class ReportsController < ApplicationController
  def new; end

  def create
    @transactions = transactions_collection
    @transactions_meta = { started_at: transaction_params[:started_at], finished_at: transaction_params[:finished_at] }

    render "create", status: :created
  end

  private

  def transactions_collection
    Transaction.by_transaction_type(transaction_params[:transaction_type])
               .by_category_id(transaction_params[:category_id])
               .created_in_time_slot(transaction_params[:started_at], transaction_params[:finished_at])
  end

  def transaction_params
    params.require(:transaction).permit(:started_at, :finished_at, :transaction_type, :category_id)
  end
end
