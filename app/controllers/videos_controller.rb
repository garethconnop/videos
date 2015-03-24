class VideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@videos = Video.all.order("created_at DESC")
  end

  def show
  	# @video = Video.find(params[:id])
  end

  def new
  	@video = current_user.videos.build
  end

  def create
  	@video = current_user.videos.build(video_params)

  	if @video.save
  	  redirect_to @video
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @video.update(video_params)
  	  redirect_to @video
  	else
  	  render 'edit'
  	end
  end

  def destroy
  	@video.destroy
  	redirect_to root_path
  end

  private

  def find_video
  	@video = Video.find(params[:id])
  end

  def video_params
  	params.require(:video).permit(:title, :length, :date, :description, :video_id, :slug)
  end
end
