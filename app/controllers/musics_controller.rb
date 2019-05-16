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
    
    if Study.where("user_id = ? and start_at = ?", current_user.id, Date.today).present?
      study = Study.where("user_id = ? and start_at = ?", current_user.id, Time.zone.today).first
      study_set = study.set
      study_set = study_set + 1
      study.update_attribute :set, study_set
    else
      study = Study.new
      user = current_user.id
      study.user_id = user
      study.set = 1
      study.start_at = Date.today
      study.save!
    end
  end

  private

  def study_params

  end

end


















