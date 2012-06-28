require 'yaml'

module JekyllConverter
  class Reader
    attr_reader :title, :tags, :body

    def initialize(input_io)
      content = input_io.read

      read_body_and_data(content)

      @title = @data['title']
      @tags = @data['categories']
    end

    private

    def read_body_and_data(content)
      # following code lovingly adapted from Jekyll
      begin
        if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m # matches everything between --- and ---
          @body = $' # Everything after the match
          @data = YAML.load($1)
        end
      rescue => e
        puts "YAML Exception"
      end
    end

  end
end
