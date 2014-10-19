module DeviseHashcash
  class FormBuilder < ActionView::Helpers::FormBuilder

    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::FormOptionsHelper

    def hashcashed_fields_for(record_or_name_or_array, *args, &block)
      # Add a :parent_builder to the args so that nested translations can be possible in Rails 3
      options = args.extract_options!
      options[:parent_builder] ||= self

      # Wrap the Rails helper
      fields_for(record_or_name_or_array, *(args << options), &block)
    end
  end
end
