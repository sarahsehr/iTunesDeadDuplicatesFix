
$:.unshift File.join(File.dirname(__FILE__),'..','lib')



require File.join(File.dirname(__FILE__),'test_helper.rb')
require 'dead_duplicates_fix'

class DeadDuplicatesFixTest < Test::Unit::TestCase
  
  should "read in the non-dead tracks" do
    file = File.join(File.dirname(__FILE__),"iTunes_Music_Library_mini.xml")
    fix = DeadDuplicatesFix.new file
    fix.read_tracks
    
    #stub here
    assert_equal 5, fix.track_table.size
    size = 0
    fix.track_table.each do |index, track|
      size += track.size
    end
    assert_equal 8, size #total number of entries
  end
  
  should "read in the playlists and their songs" do
    file = File.join(File.dirname(__FILE__),"iTunes_Music_Library_mini.xml")
    fix = DeadDuplicatesFix.new file
    fix.read_tracks
    fix.read_playlists
    
    assert_equal 2, fix.playlists.size
    assert_equal 8, fix.playlists[0].size
    assert_equal 2, fix.playlists[1].size
  end
end
