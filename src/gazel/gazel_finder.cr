
module Gazel

  class GazelFileFinder

    AVAILABLE_GAZEL_FILES = [
      "gazelfile",
      "Gazelfile",
      "gazelfile.yml",
      "Gazelfile.yml",
      "build.yml"
    ]

    def initialize()
      @gazel_files = AVAILABLE_GAZEL_FILES.dup
    end

    def find(options)
      here = Dir.current

      until filename = have_gazel_file?
        Dir.cd ".."

        return { "", here } if Dir.current == here || options[:no_search]?

        here = Dir.current
      end
      { filename, here }
    end

    private def have_gazel_file?()
      @gazel_files.each do |gazel_file|
        return "" if gazel_file == ""

        if File.exists? gazel_file
          others = Dir.glob gazel_file

          return others.size == 1 ? others.first : gazel_file
        end
      end
      ""
    end
  end

end
