require 'net/http'
require 'uri'
require 'json'
require 'google/apis/youtube_v3'
include MusicsHelper

class MusicsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def search
    # youtube_api
    mixcloud_api

    respond_to do |format|
        format.js{render :index}
    end
  end

  def play
    @title = params[:title]
    @image_url = params[:image_url]
    @music_url = params[:music_url]
  

    create_or_not_musics
    current_user.music_histories.create(music_id: create_or_not_musics)

  end

  def rest
    create_or_update_studies
  end

  def history
    @musics = current_user.music_histories.order(created_at: :desc)
    @created_at = current_user.music_histories.pluck(:created_at).sort!.reverse!
  end
end


















