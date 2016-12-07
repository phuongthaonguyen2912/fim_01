class LyricsController < ApplicationController
  load_and_authorize_resource only: :create
  before_action :find_song
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @lyrics = @song.lyrics.is_approve
    @lyric = Lyric.new
  end

  def new	
  end

  def create
    @lyric = @song.lyrics.build lyric_params
    if @lyric.save
      flash[:success] = t "flash.create_success"
      redirect_to song_lyrics_path
    else
      flash[:danger] = t "flash.create_failed"
      render :new
    end
  end

  private
  def lyric_params
    params.require(:lyric).permit(:content).merge user_id: current_user.id
  end

  def find_song
    @song = Song.find_by id: params[:song_id]
    if @song.blank?
      flash[:danger] = t "controllers.lyrics.find_song.flash"
      redirect_to root_path
    end
  end
end
