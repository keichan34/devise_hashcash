module DeviseHashcash
  module HashcashValidator
    module InstanceMethods
      class HashcashValidator < ActiveModel::EachValidator
        def validate_each(record, attribute, value)
          record.errors.add attribute, :invalid
        end
      end
    end
  end
end
