require File.dirname(__FILE__) + '/../spec_helper'

describe Oligo do
  it "should be valid" do
    Oligo.new.should be_valid
  end
end
