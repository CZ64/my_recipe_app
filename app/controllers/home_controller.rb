class HomeController < ApplicationController
  def index
    # TODO: 全カテゴリー表示
    # TODO: ランキング表示
    @users = User.all
  end
end
