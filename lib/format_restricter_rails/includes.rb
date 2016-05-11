module FormatRestricterRails
  module Includes

    def self.included(base)
      base.extend(ClassMethods)
      base.instance_eval do
        private_class_method :normalize_option
      end
    end

    module ClassMethods
      def restrict_formats_to(*args)
        options = args.extract_options!
        except_list = normalize_option(options, :except)
        only_list = normalize_option(options, :only)
        allowed_formats = args
        before_action(only: only_list, except: except_list) do |controller|
         	unless allowed_formats.include?(request.format.symbol)
            render nothing: true, status: 406
          end
        end
      end

      def normalize_option(options, key)
        value = options.fetch(key, [])
        value = [value] unless value.is_a?(Array)
        value.collect {|e| e.to_sym}      
      end
    end
  end
end