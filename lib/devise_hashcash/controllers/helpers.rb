module DeviseHashcash
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :hashcash_salt
      end

      protected

      def hashcash_salt
        session[:hashcash_salt] = SecureRandom.base64(12)
      end
    end
  end
end
