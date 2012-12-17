# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')


#require 'test/test_helper'
require "track"

class TrackTest < Test::Unit::TestCase
  TRACK = "<key>3065</key>
                  <dict>
                          <key>Track ID</key><integer>3065</integer>
                          <key>Name</key><string>The Reason</string>
                          <key>Artist</key><string>Celine Dion</string>
                          <key>Album Artist</key><string>Celine Dion</string>
                          <key>Composer</key><string>Carole King &#38; Mark Hudson &#38; Greg Wells</string>
                          <key>Album</key><string>Let's Talk About Love</string>
                          <key>Genre</key><string>Easy Listening</string>
                          <key>Kind</key><string>MPEG audio file</string>
                          <key>Size</key><integer>6026727</integer>
                          <key>Total Time</key><integer>301217</integer>
                          <key>Disc Number</key><integer>1</integer>
                          <key>Disc Count</key><integer>1</integer>
                          <key>Track Number</key><integer>1</integer>
                          <key>Year</key><integer>1997</integer>
                          <key>BPM</key><integer>146</integer>
                          <key>Date Modified</key><date>2010-09-15T07:29:07Z</date>
                          <key>Date Added</key><date>2008-06-28T07:33:30Z</date>
                          <key>Bit Rate</key><integer>160</integer>
                          <key>Sample Rate</key><integer>44100</integer>
                          <key>Comments</key><string> 00000000 00000210 000007EC 0000000000CAA784 00000000 00000000 00000000 00000000 00000000     00000000 00000000 00000000</string>
                          <key>Play Count</key><integer>3</integer>
                          <key>Play Date</key><integer>3365216993</integer>
                          <key>Play Date UTC</key><date>2010-08-21T13:29:53Z</date>
                          <key>Skip Count</key><integer>2</integer>
                          <key>Skip Date</key><date>2010-06-29T04:18:39Z</date>
                          <key>Album Rating</key><integer>60</integer>
                          <key>Album Rating Computed</key><true/>
                          <key>Sort Name</key><string>Reason</string>
                          <key>Persistent ID</key><string>BB3C4319653FDE7F</string>
                          <key>Track Type</key><string>File</string>
                          <key>Location</key><string>file://localhost/Users/sarah/Music/iTunes/iTunes%20Media/Music/Celine%20Dion/Let's%20Talk%    20About%20Love/01%20The%20Reason.mp3</string>
                          <key>File Folder Count</key><integer>5</integer>
                          <key>Library Folder Count</key><integer>1</integer>
                  </dict>"
  
  
  should "be initializable" do
    track = Track.new TRACK
    assert_equal "<integer>3065</integer>", track.attributes["Track ID".to_sym]
    assert_equal "<string>The Reason</string>", track.attributes["Name".to_sym]
  end
  
  should "create a hashkey from name, artist, album, and length" do
    track = Track.new TRACK
    assert_equal "<string>The Reason</string>,<string>Celine Dion</string>,<string>Let's Talk About Love</string>,<integer>301217</integer>", track.hashkey
  end
end
