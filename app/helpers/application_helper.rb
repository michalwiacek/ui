module ApplicationHelper
  # def link_to_add_fields(name, f, association)
  #   new_object = f.object.send(association).klass.new
  #   id = new_object.object_id
  #   fields = f.fields_for(association, new_object, child_index: id) do |builder|
  #     render(association.to_s.singularize + "_fields", f: builder)
  #   end
  #   link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  # end

  def nested_groups(groups)
    s = content_tag(:ul) do
      groups.map do |group, sub_groups|
        content_tag(:li,(group.name + nested_groups(sub_groups)).html_safe)
      end.join.html_safe
    end
  end
end
