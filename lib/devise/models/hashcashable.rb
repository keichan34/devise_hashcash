module Devise
  module Models
    module Hashcashable
      extend ActiveSupport::Concern

      included do
        validates :hashcash_value, presence: true, hashcash: true, if: :requires_hashcash_validation?

        attr_accessor :hashcash_value
      end

      def requires_hashcash_validation?
        new_record?
      end
    end
  end
end
