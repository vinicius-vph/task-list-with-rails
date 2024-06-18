class WelcomeController < ApplicationController
  def index
    @images = Board.default_images
  end
end
