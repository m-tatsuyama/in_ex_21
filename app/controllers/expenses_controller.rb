class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to dashboard_path(expense_params[:month])
    else
      render :new
    end
  end

  def destroy
    expense = Expense.find(expense_params[:id])
    expense.destroy
  end

  def edit
  end

  private

  def expense_params
    params.require(:expense).permit(:ex_amount, :about_ex, :category_id, :month).merge(user_id: current_user.id)
  end
end
