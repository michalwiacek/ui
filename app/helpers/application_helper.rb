# frozen_string_literal: true

module ApplicationHelper
  def nested_groups(groups)
    s = content_tag(:ul) do
      groups.map do |group, sub_groups|
        content_tag(:li, (group.name + nested_groups(sub_groups)).html_safe)
      end.join.html_safe
    end
  end

  def my_filter_field_tag(name, type, options=nil, value="")
    case type
    when 'boolean'
      "<div class='custom-control custom-checkbox'>
        <input name='#{name}' type='checkbox' class='#{name}custom-control-input' id='#{name}'>
        <label class='#{name}custom-control-label' for='#{name}'>#{name}</label>
      </div>".html_safe
    when 'decimal', 'integer'
      "<label class='#{name}custom-control-label' for='#{name}Od'>#{name}</label>
      <input name='#{name}Od' value='#{value}' type='number' id='#{name}Od' placeholder='od:'/><br>
      <input name='#{name}Do' value='#{value}' type='number' id='#{name}Do' placeholder='do:'/>".html_safe
    when 'string'
      "<label class='#{name}custom-control-label' for='#{name}'>#{name}</label>
      <input name='#{name}' value='#{value}' type='text' id='#{name}'/>".html_safe
    when 'enum'
      select = "<label class='#{name}custom-control-label' for='#{name}Od'>#{name}</label>
      <select name='#{name}' id='#{name}' >".html_safe
      if options
        options.each do |o|
          select << "<option value='#{o}'>'#{o}'</option>".html_safe
        end
      end
      select << "</select>".html_safe
    else
      "<input name='#{name}' value='#{value}' type='text' />".html_safe
    end
  end

end
