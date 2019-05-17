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
    youtube_api
    mixcloud_api

    respond_to do |format|
        format.js{render :index}
    end
  end

  def play
    @title = params[:title]
    @image_url = params[:image_url]
    @music_url = params[:music_url]

    create_musics
  end

  def rest
    create_or_update_studies
  end
end


















