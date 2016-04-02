require "option_parser"

require "./aliases"
require "./gazel_finder"

module Gazel

  class Application

    DEFAULT_NAME = "gazel"
    
    def initialize()
      @name = DEFAULT_NAME
      @top_level_tasks = [] of String
    end

    def run()
      init @name
      setting = load_gazel_file
      top_level setting
    end

    def init(app_name)
      args = handle_options ARGV.clone

      collect_command_line_tasks args
    end

    private def handle_options(args)
      options[:trace_output] = $stderr

      parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{@name} [-f <gazel file>] [<options>] <targets>..."
        opts.separator ""
        opts.separator "Options:"

        opts.on "-B", "--always-build", "Build does all targets unconditinally." do |v|
          options[:always_build] = true
        end

        opts.on "-C dir", "--directory=dir", "Move to directory" do |dir|
          options[:current_directory] = dir
        end

        opts.on "-h", "--help", "Display this help message" do
          puts opts
          exit
        end
      end
      parser.parse args
    end

    private def collect_command_line_tasks(args)
      if args.is_a? Array(String)
        args.each do |arg|
          @top_level_tasks << arg unless arg =~ /^-/
        end
      end

      @top_level_tasks << default_task_name if @top_level_tasks.empty?
    end

    private def default_task_name()
      "default"
    end

    private def load_gazel_file()
      raw_load_gazel_file
    end

    private def raw_load_gazel_file()
      finder = GazelFileFinder.new
      
      gazel_file, location = finder.find options
    end

    def top_level(setting)
      
    end

    def options()
      @options ||= {} of Symbol => Any
    end
  end

end
