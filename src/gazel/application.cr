require "option_parser"

module Gazel

  class Application

    DEFAULT_NAME = "gazel"
    
    def initialize()
      @name = DEFAULT_NAME
    end

    def run()
      init @name
      setting = load_gazel_file
      top_level setting
    end

    def init(app_name)
      args = handle_options
    end

    def handle_options()
      options[:trace_output] = $stderr

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{@name} [-f <gazel file>] [<options>] <targets>..."
        opts.separator ""
        opts.separator "Options:"
        opts.on "-B", "--always-build", "" do |v|
          options[:always_build] = true
        end

        opts.on "-C dir", "--directory=dir", "" do |dir|
          options[:current_directory] = dir
        end

        opts.on "-h", "--help", "Display this help message" do
          puts opts
          exit
        end
      end
      parser.parse ARGV
    end

    def load_gazel_file()
      raw_load_gazel_file
    end

    def raw_load_gazel_file()
      nil
    end

    def top_level(setting)
      
    end

    def options()
      @options ||= {} of Symbol => (Int32 | String | Bool | IO | Nil)
    end
  end

end
