class CategoryForm
  include ActiveModel::Model

  attr_accessor :name, :project_id, :template_id, :requested_by_id, :owned_by_id

  validates :template_id, presence: true

  def initialize(params = {})
    @project_id = params[:project_id]
    @template_id = params[:template_id]
    @requested_by_id = params[:requested_by_id]
    @owned_by_id = params[:owned_by_id]
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
      create_stories
    end
  end

  def create_stories
    @template = Template.find(@template_id)
    @story_templates = @template.story_templates
    @story_templates.each do |st|
      st.project_id = @project_id unless @project_id.blank?
      st.copy_story_to_project
    end
  end
end