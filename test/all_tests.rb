#Run all tests

Dir['**/*_test.rb'].each { |test_case| require File.join(File.dirname(__FILE__), "..", test_case) }