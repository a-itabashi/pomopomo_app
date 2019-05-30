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

  def create_or_update_studies    
    if Study.where("user_id = ? and start_at = ?", current_user.id, Date.today).present?
      study = Study.where("user_id = ? and start_at = ?", current_user.id, Time.zone.today).first
      study_set = study.set
      study_set += 1 
      study.update_attribute :set, study_set
    else
      study = Study.new(user_id: current_user.id, set: 1, start_at: Date.today)
      study.save!
    end
  end

  def create_or_not_musics
    if Music.where("title = ? ", @title).pluck(:id).present?
      music_id = Music.where("title = ? ", @title).pluck(:id)[0]
    else
      music_id = create_musics
    end
  end

  def create_musics  
    unless Music.where("title = ?", @title).present?
      music = Music.new(title: @title, image_url: @image_url, music_url: @music_url)
      music.save!
      music.id
    end
  end
  
end
