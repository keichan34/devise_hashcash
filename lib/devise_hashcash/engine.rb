module DeviseHashcash
  class Engine < ::Rails::Engine
    config.after_initialize do
      Devise::ParameterSanitizer.send :prepend, DeviseHashcash::ParameterSanitizer
    end

    initializer 'devise_hashcash.initializer' do |app|
      app.config.assets.paths << root.join('assets', 'javascripts')

      ActiveSupport.on_load(:action_view) do
        include DeviseHashcash::Helpers::FormHelper
      end

      ActiveSupport.on_load(:action_controller) do
        include DeviseHashcash::Controllers::Helpers
      end
    end
  end
end
