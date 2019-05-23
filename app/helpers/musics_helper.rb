module MusicsHelper
  
  def youtube_api
    if params[:q] != ""
        q = params[:q]
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = ENV['YOUTUBE_KEY']
        youtube_response = youtube.list_searches("id,snippet", type: "video", q: q, max_results: 2)
        if youtube_response.items.empty?
          puts "youtube api errors"
          exit!
        end
        @youtube_response = youtube_response.items
    end
  end

  def mixcloud_api
    if params[:q] != ""
      q = params[:q]
      uri = URI.parse URI.encode("https://api.mixcloud.com/search/?q=#{q}&amp;type=cloudcast")
      mixcloud_response = JSON.load(Net::HTTP.get(uri))
      if mixcloud_response["data"].empty?
        puts "mixcloud api errors"
        exit!
      end
      @mixcloud_response = mixcloud_response["data"]
    end
  end

  def create_or_update_studies    
    if Study.where("user_id = ? and start_at = ?", current_user.id, Date.today).present?
        study = Study.where("user_id = ? and start_at = ?", current_user.id, Time.zone.today).first
        study_set = study.set
        study_set = study_set + 1
        study.update_attribute :set, study_set
    else
      study = Study.new
      study.user_id = current_user.id
      study.set = 1
      study.start_at = Date.today
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
      music = Music.new
      music.title = @title
      music.image_url = @image_url
      music.music_url = @music_url
      music.save!
      music.id
    end
  end
  
end
