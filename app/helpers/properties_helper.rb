# frozen_string_literal: true

module PropertiesHelper

    def property_show(p)
        p.images.each do |p|
            return image_tag p.variant(resize_to_limit: [350, 350])
        end 
    end 

    def property_main(p)
     p.images.attached? ? property_show(p) : "placeholder"
    end 

end
