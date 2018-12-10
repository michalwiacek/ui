# frozen_string_literal: true

module ApplicationHelper
  def nested_groups(groups)
    s = content_tag(:ul) do
      groups.map do |group, sub_groups|
        content_tag(:li, (group.name + nested_groups(sub_groups)).html_safe)
      end.join.html_safe
    end
  end
end
