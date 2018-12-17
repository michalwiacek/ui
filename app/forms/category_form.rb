class CategoryForm
  include ActiveModel::Model

  attr_accessor :name, :parent_id, :is_last, :categories_properties_attributes, :property_attributes, :property_ids, :existing_category_id

  validates :template_id, presence: true

  def initialize(params = {})
    @name = params[:name]
    @parent_id = params[:parent_id]
    @is_last = params[:is_last]
  end 

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    ActiveRecord::Base.transaction do
      create_category
    end
  end

  def create_category
  end

  def update_category
  end
end