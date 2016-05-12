module FormatRestricterRails
  module Includes

    def self.included(base)
      base.extend(ClassMethods)
      base.instance_eval do
        private_class_method :register_before_action
      end
    end

    module ClassMethods
      def restrict_formats_to(*args)
        options = args.extract_options!
        allowed_formats = args.collect {|e| e.to_sym}
        register_before_action(options, allowed_formats)
      end

      def register_before_action(options, allowed_formats)
        before_action(options) do |controller|
          unless allowed_formats.include?(request.format.symbol)
            render nothing: true, status: 406
          end
        end
      end
    end
  end
end