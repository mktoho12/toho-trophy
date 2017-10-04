module Web
  module Views
    class ApplicationLayout
      include Web::Layout
      
      def user_signed_in?
        false
      end
    end
  end
end
