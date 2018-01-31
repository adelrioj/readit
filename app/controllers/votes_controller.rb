class VotesController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @story.votes.create(user: @current_user)
    respond_to do |format|
      format.html do
        redirect_to @story, notice: 'Vote was successfully created.'
      end
      format.js {}
    end
  end
end
