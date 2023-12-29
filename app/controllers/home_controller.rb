class HomeController < ApplicationController
  def index
    @boards = item_list
    @colors = item_bg_colors.shift.first
  end

  private

  def item_list
    [
      {
        title: "Domésticas",
        description: "This is a description for Item 1",
        image_url: "document-arrow-solid.svg",
        span: "mt-4"
      },
      {
        title: "Profissionais",
        description: "This is a description for Item 2",
        image_url: "arrow-path-solid.svg",
        span: ""
      },
      {
        title: "Estudos",
        description: "This is a description for Item 3",
        image_url: "cursor-arrow-solid.svg",
        span: "mt-4"
      },
      {
        title: "Lazer",
        description: "This is a description for Item 4",
        image_url: "folder-solid.svg",
        span: "mt-2"
      }
    ]
  end

  def item_bg_colors
    ["bg-indigo-200", "bg-purple-200", "bg-pink-200", "bg-blue-gray-200"].shuffle
  end
end
