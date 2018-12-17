# frozen_string_literal: true

module CategoriesHelper

    def link_to_add_property(form)
        wrap_object = proc do |categories_properties|
          categories_properties.build_property
        end
      
        link_to_add_association "Add Property", form, :categories_properties,'data-association-insertion-node' => "#category-properties ol",
        'data-association-insertion-method' => "append", class:"btn aqua-gradient hidden", wrap_object: wrap_object
    end

end
