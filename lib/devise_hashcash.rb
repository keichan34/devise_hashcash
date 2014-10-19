require "devise_hashcash/version"

module DeviseHashcash
  autoload :ParameterSanitizer, 'devise_hashcash/parameter_sanitizer'
  autoload :FormBuilder, 'devise_hashcash/form_builder'

  module HashcashValidator
    autoload :InstanceMethods, 'devise_hashcash/hashcash_validator/instance_methods'
  end

  module Controllers
    autoload :Helpers, 'devise_hashcash/controllers/helpers'
  end

  module Helpers
    autoload :FormHelper, 'devise_hashcash/helpers/form_helper'
  end
end

ActiveModel::Validations.send :include, DeviseHashcash::HashcashValidator::InstanceMethods

require 'devise'
require 'devise_hashcash/engine'

Devise.add_module :hashcashable, model: 'devise/models/hashcashable'
