require './lib/MP3'

class Playlist
	attr_reader :title, :description, :songs

	@@playlists = []

  def Playlist.clear
  	@@playlists = []
  	@songs = []
  end
	
  def Playlist.playlists
  	@@playlists
  end

  def Playlist.create(title, description)
  	new_playlist = Playlist.new({:title => title, :description => description})
  	@@playlists << new_playlist
  	new_playlist
  end

  def initialize(attributes)
  	@title = attributes[:title] 
  	@description = attributes[:description]
  	@songs = []
  end

  # def songs
  # 	@songs
  # end
end
