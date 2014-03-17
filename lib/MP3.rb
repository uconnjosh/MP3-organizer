require './lib/Playlist'

class MP3
	attr_reader :song, :album, :artist, :target_playlist

	def MP3.create(song, artist, album, target_playlist)
		new_mp3 = MP3.new({:song => song, :artist => artist, :album => album, :target_playlist => target_playlist})
		Playlist.playlists.each_with_index do |playlist, index|
			if playlist.title == target_playlist
				Playlist.playlists[index].songs << new_mp3
			end
		end
		new_mp3
	end

	def initialize(attributes)
		@song = attributes[:song]
		@artist = attributes[:artist]
		@album = attributes[:album]
		@target_playlist = attributes[:target_playlist]

	end
end
