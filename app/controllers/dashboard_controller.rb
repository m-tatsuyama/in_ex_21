class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = current_user.id
  end

  def show
    search_date = params[:id]
    @expenses = current_user.expenses.where(month: search_date.in_time_zone.all_month)
    @incomes = current_user.incomes.where(month: search_date.in_time_zone.all_month)
    @sumexpenses = @expenses.group(:category_id).sum(:ex_amount)
    @categories = Category.find(@sumexpenses.keys)
    @sumincomes = @incomes.sum(:in_amount)
    @total_ex = @expenses.sum(:ex_amount)
    @valiable = @expenses.where(category_id: [2, 3, 4, 5, 6, 7, 8, 9, 10, 19]).sum(:ex_amount)
    @fixed = @expenses.where(category_id: [11, 12, 13, 14, 15, 16, 17, 18]).sum(:ex_amount)
    @diff = @sumincomes - @total_ex
  end
end
