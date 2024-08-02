module BoardMethods
  extend ActiveSupport::Concern

  module ClassMethods
    def default_boards
      default_settings('boards').map do |board|
        Struct.new(*board.keys.map(&:to_sym)).new(*board.values)
      end
    end

    def default_images
      default_settings('images')
    end

    def default_settings(key = nil)
      yaml = YAML.load_file(Rails.root.join('config', 'settings.yml'))
      default_boards = yaml['seeds'][key]
    end
  end
end