class DashboardController < ApplicationController
  # ユーザーを特定した上で実行するbefore action入れる！
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
    # 受け取った支出をいれる
    @sumexpenses = @expenses.group(:category_id).sum(:ex_amount)
    # カテゴリーをキーと紐付ける
    @categories = Category.find(@sumexpenses.keys)
    # 収入の総合計
    @sumincomes = @incomes.sum(:in_amount)
    # 支出の合計
    @total_ex = @expenses.sum(:ex_amount)
    # 変動費の合計
    @valiable = @expenses.where(category_id: [2,3,4,5,6,7,8,9,10,19]).sum(:ex_amount)
    # 固定費の合計
    @fixed = @expenses.where(category_id: [11,12,13,14,15,16,17,18]).sum(:ex_amount)
    # 収入から支出を引いた額
    @diff = @sumincomes - @total_ex

  end
end