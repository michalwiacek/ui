# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    binding.pry
    if params[:category]
      @category = Category.find(params[:category])
      descendant_ids = @category.descendant_ids
      descendant_ids << @category.id
      @products = Product.where(category_id: descendant_ids)
    else
      @category = Category.first
      @products = Product.all
    end
    @properties = @category.ancestors.map {|x| x.properties}.flatten << @category.properties
    @properties.flatten!

    if params[:name] && params[:field_value] && params[:category]
      @category = Category.find(params[:category])
      descendant_ids = @category.descendant_ids
      descendant_ids << @category.id
      prop_values_to_filter = PropertyValue.joins(:property).where("properties.name = '#{params[:name]}'")
      pv = prop_values_to_filter.where("field_value = '#{params[:field_value]}'")
      @products = []
      @products << Product.find_by(id: pv.map(&:product_id), category_id: descendant_ids)
      @products.compact!
    end
  end

  def edit
  end

  def update
    @product = Product.update(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :edit
    end
  end
  
  def new
    @product = Product.new(category_id: params[:category_id])
    @product.category.ancestors.map {|x| @product.properties << x.properties}
    @product.properties << @product.category.properties
    @product.properties.each {|x| @product.property_values.build(property_id: x.id)}
  end
  
  def show; end
  
  def create
    @product = Product.new(product_params)
    @product.category.ancestors.map {|x| @product.properties << x.properties}
    @product.properties << @product.category.properties
    @product.property_values.each {|x| x.product_id = @product.id}
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def set_product
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:name, :category_id, :price,
       property_values_attributes: [:id, :field_value, :product_id, :property_id])
  end
end
