require './lib/Playlist'
require './lib/MP3'

def main_menu
	  puts 'Hello!! Welcome to the MP3 Playlist creator!!!'
	  puts 'Press N to create a new playlist'
	  puts 'Press V to view your playlists'
	  puts 'Press S to add a new song'
	  puts 'Press X to quit'
  main_response = gets.chomp
  case main_response
  when 'N'
    new_playlist
  when 'V'
    view_playlist 
  when 'S'
  	add_song
  when 'X'
  	puts 'Goodbye, COME AGAIN!!!'
  else
  'Please learn how to follow instructions and kindly press a VALID key!!'
  main_menu
  end
end

def new_playlist
	puts 'Please enter a title for your playlist:'
	title = gets.chomp
	puts "Got it! Now enter a description for #{title}"
	description = gets.chomp
	Playlist.create(title, description)
	puts "#{title} has been added to your library!!"
	main_menu
end

def view_playlist
	puts 'Here are your playlists:'
	Playlist.playlists.each_with_index do |unit, index|
		puts index.to_s + unit.title
	end
	puts "To see the contained songs, enter playlist's number"
	playlist_query = gets.chomp.to_i
	view_songs(playlist_query)
	main_menu
end

def add_song
	puts "What's the name of your song?"
	song = gets.chomp
	puts "Got it! Now enter the artist's name/group"
	artist = gets.chomp
	puts "Great! Enter the album name!"
	album = gets.chomp
	puts "Cool! Finally, enter the name of the playlist you want to add to"
	target_playlist = gets.chomp
	MP3.create(song, artist, album, target_playlist)
	main_menu
end

def view_songs(playlist_query)
	puts "Songs:"
	Playlist.playlists[playlist_query].songs.each do |song|
		puts song.song
	end
	main_menu
end

main_menu

