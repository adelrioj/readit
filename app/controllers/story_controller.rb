class StoryController < ApplicationController
  def index
    @current_time = Time.now
  end
end
