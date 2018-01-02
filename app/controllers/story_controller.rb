class StoryController < ApplicationController
  def index
    @current_time = Time.now
    @story = Story.find_by(name: 'SitePoint Forums')
    @random_story = Story.order('RANDOM()').first
  end
end
