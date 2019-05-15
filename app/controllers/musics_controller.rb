require 'net/http'
require 'uri'
require 'json'
require 'google/apis/youtube_v3'

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
    @videoid = params[:videoid]
  end

  def rest
  end
end
