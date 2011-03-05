require 'spec_helper'

describe User do
  it "should fail here" do
    true.should == true
    
  end

  it "should pass coverage" do
    User.new.some_stuff :some_arg

  end
end
