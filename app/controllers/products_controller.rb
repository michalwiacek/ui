# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    if params[:category]
      @category = Category.find(params[:category])
      descendant_ids = @category.descendant_ids
      descendant_ids << @category.id
      @products = Product.where(category_id: descendant_ids)
    else
      @category = Category.first
      @products = Product.all
    end
    @q = Product.ransack(params[:q])
    # @products = @q.result
    # @products = @products.where('name like ?', '%' + params[:name] + '%') if params[:name]
    # @products = @products.where('price like ?', '%' + params[:price] + '%') if params[:price]
    @categories = Category.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s
    }.sort {|x,y| x.ancestry <=> y.ancestry 
    }.map{ |c| {:name => "-" * (c.depth - 1) + c.name, :id => c.id}}
  end

  def edit
  end

  def update
    @product = Product.update(product_params)
    # @product.category.ancestors.map {|x| @product.properties << x.properties}
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def new
    @product = Product.new(category_id: params[:category_id])
    # proprety_ids = @product.category.ancestors.map {|x| x.properties.map {|y| y.id}}.flatten
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
    if @product.save!
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end
  
  private
  
  def set_product
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:name, :category_id, :price, property_values_attributes: [:id, :field_value, :product_id, :property_id])
  end
end
