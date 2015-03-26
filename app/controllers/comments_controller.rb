class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
	  @video = Video.find(params[:video_id])
	  @comment = Comment.create(params[:comment].permit(:content))
	  @comment.user_id = current_user.id
    @comment.video_id = @video.id

    if @comment.save
    	redirect_to video_path(@video, anchor: "comment_#{@comment.id}")
    else
    	redirect_to video_path(@video), alert: "Unable to save your comment"
    end
  end

  def edit
  	@video = Video.find(params[:video_id])
  	@comment = @video.comments.find(params[:id])
  end

  def update
    @video = Video.find(params[:video_id])
  	@comment = @video.comments.find(params[:id])

  	if @comment.update(params[:comment].permit(:content))
  	  redirect_to video_path(@video)
  	else
  	  render 'edit'
  	end
  end

  def destroy
    @video = Video.find(params[:video_id])
    @comment = @video.comments.find(params[:id])
    @comment.destroy
    redirect_to video_path(@video)
  end
  
end
