class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to current_user, success: '更新しました'
    else
      render 'show'
    end
  end

  def update_servings_for
    @user = User.find(current_user.id)
    if @user.update(:servings_for => params[:servings_for])
      redirect_to current_user, success: '更新しました'
    else
      render 'show'
    end
  end

  def menus
    @menus = current_user.menus.includes(:recipe)
    render '/menus/index'
  end

  def favorite_recipes
    @favorite_recipes = current_user.recipes_through_favorite.includes(:user)
    render '/favorite_recipes/index'
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :servings_for)
    end
end
