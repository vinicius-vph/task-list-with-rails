class HomeController < ApplicationController
  def index
    @items = item_list
    @colors = item_bg_colors
  end

  private

  def item_list
    [
      {
        name: "Domésticas",
        description: "This is a description for Item 1",
        image_url: "document-arrow-solid.svg",
        span: "mt-4"
      },
      {
        name: "Profissionais",
        description: "This is a description for Item 2",
        image_url: "arrow-path-solid.svg",
        span: ""
      },
      {
        name: "Estudos",
        description: "This is a description for Item 3",
        image_url: "cursor-arrow-solid.svg",
        span: "mt-4"
      },
      {
        name: "Lazer",
        description: "This is a description for Item 4",
        image_url: "folder-solid.svg",
        span: "mt-2"
      }
    ]
  end

  def item_bg_colors
    ["bg-red-200", "bg-yellow-200", "bg-green-200", "bg-blue-200", "bg-indigo-200", "bg-purple-200", "bg-pink-200", "bg-gray-200", "bg-blue-gray-200", "bg-cyan-200"].shuffle
  end
end
# row-span-2 col-span-2
# row-span-2 col-span-2