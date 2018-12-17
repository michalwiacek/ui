# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :categories_nested, only: %i[new edit]
  
  def index
    @categories = Category.all
    @categories_nested = Category.all.arrange
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit
    @category.twin_id = nil
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def categories_nested
    @categories = Category.not_final.each { |c| c.ancestry = c.ancestry.to_s + (!c.ancestry.nil? ? '/' : '') + c.id.to_s }
    .sort_by(&:ancestry).map { |c| ['-' * (c.depth - 1) + c.name, c.id] }
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id, :is_last, :twin_id, property_ids: [],
       categories_properties_attributes:[[ :id, :category_id, :property_id, :_destroy,
        property_attributes:[:id, :name, :field_type, :_destroy, :options]]])
  end
end