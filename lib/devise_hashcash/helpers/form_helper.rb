module DeviseHashcash
  module Helpers

    module FormHelper
      @@builder = DeviseHashcash::FormBuilder
      mattr_accessor :builder

      @@default_form_class = 'hashcashed'
      mattr_accessor :default_form_class

      def hashcashed_fields_for(record_or_name_or_array, *args, &proc)
        options = args.extract_options!
        options[:builder] ||= @@builder
        options[:html] ||= {}
        options[:custom_namespace] = options.delete(:namespace)

        singularizer = defined?(ActiveModel::Naming.singular) ? ActiveModel::Naming.method(:singular) : ActionController::RecordIdentifier.method(:singular_class_name)

        class_names = options[:html][:class] ? options[:html][:class].split(" ") : []
        class_names << @@default_form_class
        class_names << case record_or_name_or_array
          when String, Symbol then record_or_name_or_array.to_s                                  # :post => "post"
          when Array then options[:as] || singularizer.call(record_or_name_or_array.last.class)  # [@post, @comment] # => "comment"
          else options[:as] || singularizer.call(record_or_name_or_array.class)                  # @post => "post"
        end

        options[:html][:class] = class_names.compact.join(" ")

        self.form_for(record_or_name_or_array, *(args << options), &proc)
      end
    end

  end
end
