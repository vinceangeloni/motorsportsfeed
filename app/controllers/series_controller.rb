

class SeriesController < ApplicationController
  before_action only: [:show]

  # GET /series
  # GET /series.json
  def index
    @series = Series.all
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Series.find(params[:id])
    @feeds = Feed.where(series_id: params[:id])
    @feeds.each do |feed|
      @entries = Entry.where(feed_id: feed.id).order(:created_at).page params[:page]
    end
    
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name, :description, :logo, :feeds_id, :calendar_id)
    end
end
