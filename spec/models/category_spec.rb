require 'rails_helper'

describe Category do
    let(:category_child) {FactoryBot.create(:category_child,:with_parent, name: "Sub Category") }
  
    #...
end