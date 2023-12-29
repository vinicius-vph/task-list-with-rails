class HomeController < ApplicationController
  def index
    @boards = item_list
  end

  private

  def item_list
    [
      {
        title: "Domésticas",
        description: "This is a description for Item 1",
        image_url: "document-arrow-solid.svg",
        span: "mt-4",
        color: 'bg-slate-100'
      },
      {
        title: "Profissionais",
        description: "This is a description for Item 2",
        image_url: "arrow-path-solid.svg",
        span: "mt-0",
        color: 'bg-red-100'
      },
      {
        title: "Estudos",
        description: "This is a description for Item 3",
        image_url: "cursor-arrow-solid.svg",
        span: "mt-4",
        color: 'bg-green-100'
      },
      {
        title: "Lazer",
        description: "This is a description for Item 4",
        image_url: "folder-solid.svg",
        span: "mt-2",
        color: 'bg-orange-100'
      }
    ]
  end
end
