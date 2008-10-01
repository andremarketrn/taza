require 'taza/generators/base'

module Taza
  module Generators
    class Page < Base
      attr_accessor :file_name
      def initialize(file_name,site_name)
        @file_name = file_name
        @site_name = site_name
      end

      def folder_path
        File.join('lib','sites')
      end

      def generate
        file "page.rb.erb", File.join(folder_path, @site_name, "pages",  "#{@file_name}.rb")
      end

    end
  end
end
