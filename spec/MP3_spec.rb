require 'rspec'
require 'Playlist'
require 'MP3'

 describe 'Playlist' do
 	describe '.clear' do  
 	it 'empties out all of the saved playlists' do
 	Playlist.new({:title =>'club hits', :description => 'dance your a** off with these fun beats!'})
 	Playlist.clear
 	Playlist.playlists.should eq []
 end
end
 	it 'Initializes a new playlist' do
 	   Playlist.clear 
 	   test_playlist = Playlist.new({:title =>'club hits', :description => 'dance your a** off with these fun beats!'})  
 	   test_playlist.should be_an_instance_of Playlist
 	end 
 	it 'Initializes a new playlist with a title and description' do 
 	  Playlist.clear
 	  test_playlist = Playlist.create('club hits', 'dance your a** off with these fun beats!')
 	  test_playlist.title.should eq 'club hits'
 	  test_playlist.description.should eq 'dance your a** off with these fun beats!'
 	end

 	describe '.create' do   
 	it 'creates a new playlist' do
 	  Playlist.clear 
 	  test_playlist = Playlist.create('club hits', 'dance your a** off with these fun beats!')
 	 Playlist.playlists[0].title.should eq 'club hits'
 	end 
   end
 end

 describe 'MP3' do
    Playlist.clear 
 	it 'initializes a new MP3' do
 		test_MP3 = MP3.new({:song => 'thunder', :album => 'guitar', :artist => 'garth brooks', :target_playlist => 'country'})
 		test_MP3.should be_an_instance_of MP3

 	end
 	describe '.create' do 
 		Playlist.clear
 		it 'creates a new MP3, noting song, artist, album, and desired playlist' do 
 		test_MP3 = MP3.create('daylight','matt and kim','lightning','hipster')
 		test_MP3.song.should eq 'daylight'
 		test_MP3.artist.should eq 'matt and kim'
 		test_MP3.album.should eq 'lightning'
 		test_MP3.target_playlist.should eq 'hipster'
 		
 	end
   end
  describe '.create' do
  
  	it 'creates a new MP3 with attributes, and adds it to the proper playlist' do
  		Playlist.clear
  		test_playlist = Playlist.create('hipster', 'dance your a** off with these fun beats!')
  		test_MP3 = MP3.create('daylight','matt and kim','lightning','hipster')
  		Playlist.playlists[0].songs[0].song.should eq 'daylight'
  		Playlist.playlists[0].songs[0].artist.should eq 'matt and kim'
  		Playlist.playlists[0].songs[0].album.should eq 'lightning'
  	end
  end
end





