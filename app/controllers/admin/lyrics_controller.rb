class Admin::LyricsController < ApplicationController
  load_and_authorize_resource

  def index
    @lyrics = Lyric.lyric_requests.paginate page: params[:page],
      per_page: Settings.lyrics.per_page
  end
end
