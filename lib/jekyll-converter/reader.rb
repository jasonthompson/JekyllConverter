require 'yaml'

module JekyllConverter
  class Reader
    attr_reader :title, :tags
    def initialize(input_io)
      metadata = YAML::load(input_io)
      @title = metadata['title']
      @tags = metadata['categories']
      @date = metadata['date']
    end
  end
end
