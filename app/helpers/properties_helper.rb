# frozen_string_literal: true

module PropertiesHelper

    def property_images
        if @property.images.attached? 
            @property.images.each do |p|    
               return image_tag(p)
        end
    end
    end 

    def property_thumbnail         
        @property.images.attached? ? property_images : "placeholder"
    end 

end
