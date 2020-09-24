class UsersController < ApplicationController
 
  def show
    @expense = current_user.expenses
    @income = current_user.incomes
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
