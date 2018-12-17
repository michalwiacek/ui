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
      "<label class='#{name}custom-control-label' for='#{name}_od'>#{name}</label>
      <input name='#{name}_od' value='#{value}' type='number' id='#{name}_od' placeholder='od:'/><br>
      <input name='#{name}_do' value='#{value}' type='number' id='#{name}_do' placeholder='do:'/>".html_safe
    when 'string'
      "<label class='#{name}custom-control-label' for='#{name}'>#{name}</label>
      <input name='#{name}' value='#{value}' type='text' id='#{name}'/>".html_safe
    when 'enum'
      select = String.new ""
      select << "<label class='#{name}custom-control-label' for='#{name}'>#{name}</label>
      <select name='#{name}' id='#{name}' >"
      if options
        options.split(", ").each do |o|
          select << "<option value='#{o}'>#{o}</option>"
        end
      end
      select << "</select>"
      return select.html_safe
    else
      "<input name='#{name}' value='#{value}' type='text' />".html_safe
    end
  end

  def dropdown_btn(btn_text: 'Select', &block)
    links = capture(&block) if block_given?
    btn = button_tag(class: 'btn btn-info dropdown-toggle', "aria-expanded" => false, "aria-haspopup" => true, data: { toggle: 'dropdown' },
      type: 'button') do
      concat content_tag(:span, btn_text, class: 'dropdown_btn_text')
      # concat btn_text
      # concat content_tag(:i, '', class: 'fa fa-angle-down')
    end

    drop = content_tag(:div, class: 'dropdown-menu dropdown-primary') do
      links
    end
    content_tag(:div, class: 'dropdown') do
      concat btn
      concat drop
    end
  end

end
