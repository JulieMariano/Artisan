class CategoriesController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authenticate_user!, only: [:index]
  def index
=======
  def index
    @categories = Category.all
>>>>>>> master
  end
end
