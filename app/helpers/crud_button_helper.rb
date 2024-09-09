module CrudButtonHelper
  def create button_text, path, options = {}
    content_tag(:a, href: path, class: "btn-create #{options.fetch(:class)}") do
      content_tag :p, '➕'
    end
  end

  def edit button_text, path, options = {}
    content_tag :a, href: path, class: "btn-edit #{options.fetch(:class)}" do
      content_tag :p, '✏️'
    end
  end

  def delete button_text, path, options = {}
    button_to '❌', path, method: :delete, class: "btn-delete #{options.fetch(:class)}"
  end

  def checkbox button_text, path, options = {}
    button_to '✅', path, class: "btn-check #{options.fetch(:class)}"
  end
end
