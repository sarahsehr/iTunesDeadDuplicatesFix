
$:.unshift File.join(File.dirname(__FILE__),'..','lib')



require File.join(File.dirname(__FILE__),'test_helper.rb')


class TrackTest < Test::Unit::TestCase
  
  should "work" do
    assert true
  end
  
end
