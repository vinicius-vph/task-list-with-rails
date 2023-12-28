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
  end
end