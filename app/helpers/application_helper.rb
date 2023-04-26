module ApplicationHelper
    include Pagy::Frontend
    module ApplicationHelper
        def categories
          @categories ||= Category.all
        end
      end
end
