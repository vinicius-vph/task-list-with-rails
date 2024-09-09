module ButtonHelper
  def button_for button_type, button_text, path, options = {}
    send(button_type, button_text, path, options)
  end
end
