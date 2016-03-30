
module Gazel

  class Application

    DEFAULT_NAME = "gazel"
    
    def initialize()
      @name = DEFAULT_NAME
    end

    def run()
      init
      setting = load_gazel_file
      top_level setting
    end

    def init()
    end

    def load_gazel_file()
      raw_load_gazel_file
    end

    def top_level(setting)
      
    end
  end

end
