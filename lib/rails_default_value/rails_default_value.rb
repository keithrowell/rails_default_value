module RailsDefaultValue
  
  module InstanceMethods
    
    def set_defaults
      self.class.default_values.each do |key, value|
        if value.is_a? Proc
          self.send("#{key.to_s}=", value.call)
        else
          self.send("#{key.to_s}=", value) if (self.send(key.to_s).respond_to?(:nil?) and self.send(key.to_s).nil?) or (self.send(key.to_s).respond_to?(:empty?) and self.send(key.to_s).empty?)
        end
      end
    
    end
        
  end
  
  module ClassMethods
    
    # class_eval "@@default_values = {}"
    # class_eval "def default_values ; @@default_values ; end"
    @@default_values = {}
    def default_values ; @@default_values ; end
    
    def default options
      options.each do |key, value|
        default_values[key] = value
      end
      include InstanceMethods
      before_validation :set_defaults, :on => :create
    end
      
  end
end

