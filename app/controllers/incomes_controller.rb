class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to dashboard_path(income_params[:month])
    else
      render :new
    end
  end

  def destroy
    income = Income.find(income_params[:id])
    income.destroy
  end

  def edit
  end

  private

  def income_params
    params.require(:income).permit(:in_amount, :about_in, :month).merge(user_id: current_user.id)
  end
end
