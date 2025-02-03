class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
      @category = Category.find_by(id: params[:id])
      redirect_to categories_path, alert: "Category not found" unless @category
    end

    def index
        @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy

      redirect_to categories_path
    end

    def edit
      @category = Category.find_by(id: params[:id])
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to @category, notice: "Category was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category, notice: "Категорію успішно оновлено."
      else
        render :edit
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
