# encoding: utf-8
require 'spec_helper'
require 'acts_as_fu'

build_model :my_model do
  extend RailsDefaultValue::ClassMethods
  integer  :status
  integer  :number
  string   :name
  datetime :stored_at
  attr_accessor :status
  attr_accessor :number
  attr_accessor :name
  attr_accessor :stored_at
  default :status => :fixed
  default :number => 1
  default :name => 'Fred'
  default :stored_at => -> { Time.now }
end

build_model :my_other_model do
  extend RailsDefaultValue::ClassMethods
  integer  :field_1
  integer  :field_2
  attr_accessor :field_1
  attr_accessor :field_2
  default :field_1 => 1
  default :field_2 => 2

end

describe RailsDefaultValue do  
  context "with a new object" do
    it "has a default value only after save" do
      my_model = MyModel.new
      expect(my_model.number).to be_nil
      expect(my_model.save).to be true
      expect(my_model.number).to eq 1
    end
    
    it "can override default value" do
      my_model = MyModel.new :number => 5
      expect(my_model.number).to eq 5
      expect(my_model.save).to be true
      expect(my_model.number).to eq 5
    end
  end
  
  context "when an object is created" do 
    it "has a default status of :fixed" do
      my_model = MyModel.create
      expect(my_model.status).to eq :fixed
    end
    
    it "has a default time/proc value of about the right time" do
      sleep 2
      my_model = MyModel.create
      expect(my_model.stored_at.utc).to be_within(1.second).of Time.now
    end
    
    it "has a default integer value" do
      my_model = MyModel.create
      expect(my_model.number).to eq 1
    end
    
    it "has a default string value" do
      my_model = MyModel.create
      expect(my_model.name).to eq 'Fred'
    end
    
    it "default status can be overwritten with create" do
      my_model = MyModel.create :status => :fixed
      expect(my_model.status.to_sym).to eq :fixed
      my_model = MyModel.create :status => :broken
      expect(my_model.status.to_sym).to eq :broken
    end
  end
  
  context "with a second model" do
    it "has a default value for field_1 of 1" do
      my_model = MyOtherModel.create
      expect(my_model.field_1).to eq 1
    end
    
    it "has a default value for field_2 of 2" do
      my_model = MyOtherModel.create
      expect(my_model.field_2).to eq 2
    end    
  end
  
end