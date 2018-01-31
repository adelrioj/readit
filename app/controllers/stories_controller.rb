
class StoriesController < ApplicationController

  before_action :ensure_login, only: %i[new create]

  def index
    @story = Story.order('RANDOM()').first
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:notice] = 'Story submission succeeded'
      redirect_to stories_path
    else
      render action: 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  private

  # Mass Assignment Protection
  def story_params
    params.require(:story).permit(:name, :link)
  end
end
