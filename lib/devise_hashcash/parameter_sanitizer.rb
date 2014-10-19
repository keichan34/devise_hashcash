module DeviseHashcash
  module ParameterSanitizer
    def attributes_for(action)
      case action
      when :sign_in, :sign_up
        super + [:hashcash_value]
      else super
      end
    end
  end
end
