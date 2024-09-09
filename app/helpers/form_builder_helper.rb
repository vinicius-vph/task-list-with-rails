module FormBuilderHelper
  class CustomFormBuilder < ActionView::Helpers::FormBuilder
    def label(attribute, options = {})
      options[:class] = "block text-sm font-medium text-gray-700 dark:text-white mb-1"
      super
    end
    def text_field(attribute, options = {})
      options[:class] = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      super
    end

    def email_field(attribute, options = {})
      super
    end

    def password_field(attribute, options = {})
      options[:class] = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      super
    end

    def text_area_field(attribute, options = {})
      options[:class] = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      super
    end

    def rich_text_area(attribute, options = {})
      options[:class] = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      super
    end

    def number_field(attribute, options = {})
      super
    end

    def check_box(attribute, options = {})
      super
    end

    def select(attribute, choices, options = {}, html_options = {})
      super
    end

    def submit(value = "Save changes", options = {})
      options[:class] = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
      super
    end

    def file_field(attribute, options = {})
      super
    end

    def date_field(attribute, options = {})
      super
    end

    def datetime_field(attribute, options = {})
      super
    end

    def time_field(attribute, options = {})
      super
    end

    def datetime_local_field(attribute, options = {})
      super
    end
  end
end