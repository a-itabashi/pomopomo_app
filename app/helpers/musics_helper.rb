module MusicsHelper
  
  def youtube_api
    if params[:q] != ""
        q = params[:q]
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = ENV['YOUTUBE_KEY']
        youtube_response = youtube.list_searches("id,snippet", type: "video", q: q, max_results: 2)
        @youtube_response = youtube_response.items
    end
  end

  def mixcloud_api
    if params[:q] != ""
      q = params[:q]
      uri = URI.parse URI.encode("https://api.mixcloud.com/search/?q=#{q}&amp;type=cloudcast")
      mixcloud_response = JSON.load(Net::HTTP.get(uri))
      @mixcloud_response = mixcloud_response["data"]
    end
  end
end
