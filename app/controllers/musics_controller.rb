require 'net/http'
require 'uri'
require 'json'
require 'google/apis/youtube_v3'

class MusicsController < ApplicationController
  def index
  end

  def search
    # youtube用
    if params[:q] != ""
      q = params[:q]
      youtube = Google::Apis::YoutubeV3::YouTubeService.new
      youtube.key = ENV['YOUTUBE_KEY']
      youtube_response = youtube.list_searches("id,snippet", type: "video", q: q, max_results: 2)
      @youtube_response = youtube_response.items
    end

    # mixcloud用
    # && params[:mixcloud]
    if params[:q] != ""
      q = params[:q]
      uri = URI.parse URI.encode("https://api.mixcloud.com/search/?q=#{q}&amp;type=cloudcast")
      mixcloud_response = JSON.load(Net::HTTP.get(uri))
      @mixcloud_response = mixcloud_response["data"]
    end

    respond_to do |format|
        format.js{render :index}
    end
 

  end

  def play
    @title = params[:title]
    @videoid = params[:videoid]
  end

  def rest
  end
end
