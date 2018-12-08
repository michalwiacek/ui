class ProductsController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category]
      @category = Category.find(params[:category])
      descendant_ids = @category.descendant_ids
      descendant_ids << @category.id
      @products = Product.where(category_id: descendant_ids)
    else
      @category = false
      @products = Product.all
    end
    @products = @products.where("name like ?", "%" + params[:name] + "%") if params[:name]
    @categories = Category.all
  end

  def new
    @product = Product.new(category_id: params[:category_id])
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category_id, :price, properties: Category.find(params[:product][:category_id]).fields.map {|x| x.name.to_sym})
  end

end