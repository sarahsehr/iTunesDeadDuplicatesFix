
class DeadDuplicatesFix
  
  attr_accessor :file, :track_table
  
  @@track_regex = Regexp.new("<key>Tracks</key>")
  @@playlist_regex = Regexp.new("<key>Playlists</key>")
  @@end_dict_regex = Regexp.new("</dict>")
  @@end_array_regex = Regexp.new("</array>")
  
  def initialize xmlfile
    @file = File.open xmlfile, 'r'
    @track_table = {}
    @playlists = []
    
  end
  
  def read_tracks
    
    while !@@track_regex.match(@file.readline) ; end
    @file.readline #<dict>
   
    track_lines = ""
    while !@@end_dict_regex.match(line = @file.readline)
      track_lines = line
      while !@@end_dict_regex.match(line = @file.readline)
        track_lines << line
      end
      track = Track.new(track_lines)

      if @track_table[track.hashkey]
        @track_table[track.hashkey] << track
      else
        @track_table[track.hashkey] = [ track ]
      end
      
    end

  end
  
  def read_playlists
    if @@playlist_regex.match(line = @file.readline)
      @file.readline #<array>
      playlist_lines = ""
      while !@@end_array_regex.match(line = @file.readline)
        playlist_lines = line
        while !@@end_dict_regex.match(line = @file.readline)
          playlist_lines << line
        end
        @playlists << Playlist.new(playlist_lines)
      end
    else
      puts "Error reading file.  Expecting playlist tag"
      exit
    end
  end
end


if __FILE__==$0
  unless ARGV.size == 1
    puts "Wrong number of params"
    exit 1
  end
  begin
    fix = DeadDuplicatesFix.new ARGV[0]
  ensure
    if fix && fix.file
      fix.file.close
    end
  end
end