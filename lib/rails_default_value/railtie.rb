module RailsDefaultValue
  class Railtie < Rails::Railtie
    initializer 'rails_default_value.model_additions' do
      ActiveSupport.on_load :active_record do
        extend ClassMethods
      end
    end
  end
end