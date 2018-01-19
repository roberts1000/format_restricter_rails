module FormatRestricterRails
  # Create a wrapping module so we can expose class methods into the host controllers.
  module Includes
    def self.included(base)
      base.extend(ClassMethods)
      # This is one way to mark the register_before_action method as private in a module.
      base.instance_eval { private_class_method :register_before_action }
    end

    # Define the methods that can be called by host controllers.
    module ClassMethods
      # This is the main API that host controllers will call at the top the controller.
      def restrict_formats_to(*args)
        options = args.extract_options!
        allowed_formats = args.collect(&:to_sym)
        register_before_action(options, allowed_formats)
      end

      # This method is turned into a private method above.
      def register_before_action(options, allowed_formats)
        before_action(options) do |_controller|
          render nothing: true, status: 406 unless allowed_formats.include?(request.format.symbol)
        end
      end
    end
  end
end
