class SongsController < ApplicationController
  def index
		@songs = Song.all
  end
	
	def create
		@song = Song.new(song_params[:song])		
		if @song.save 
			redirect_to @user
		end	
	end

  def new
  end
	private
	def song_params
		params.require(:song).permit(:artist, :title)
	end
end

