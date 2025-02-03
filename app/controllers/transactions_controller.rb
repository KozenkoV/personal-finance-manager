class TransactionsController < ApplicationController
    def index
       @transactions = Transaction.all.includes(:category)
    end

    def show
        @category = transaction.category
    end

    def new
        @transaction = Transaction.new
    end

    def create
      if Transaction.create(transaction_params)
        redirect_to transactions_path, notice: "Транзакцію успішно створено!"
      else
        render :new, status: :unprocessable_entity
      end
    end


    def edit
        transaction
    end

    def update
        if transaction.update(transaction_params)
          redirect_to transaction_path(@transaction), notice: "Транзакцію оновлено!"
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        transaction.destroy
        redirect_to transactions_path, notice: "Транзакцію видалено!"
    end

      private

    def transaction
        @transaction ||= Transaction.find(params[:id])
    end

    def transaction_params
        params.require(:transaction).permit(:category_id, :transaction_type, :description, :total)
    end
end
