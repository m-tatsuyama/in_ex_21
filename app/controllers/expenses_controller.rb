class ExpensesController < ApplicationController
before_action :set_expense, only: [:edit, :show]

  def index
    @expenses = Expense.all
  end

  def new
    @expenses = Expense.all
  end

  def create
    Expense.create(expense_params)
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
  end

  def edit
  end

  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
  end

  def show
  end

  private
  def expense_params
    params.require(:expense).permit(:ex_amount,:about_ex,:category_id)
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
