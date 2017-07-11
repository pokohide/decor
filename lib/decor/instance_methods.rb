module Decor
  module InstanceMethods

    def decor params
      # return self if self.class.disable_colorization
      require_windows_libs

      p self
      p params
      # scan_for_colors.inject(self.class.new) do |str, match|
      #  colors_from_params(match, params)
      #  defaults_colors(match)
      #  str << "\033[#{match[0]};#{match[1]};#{match[2]}m#{match[3]}\033[0m"
      # end
    end

    private

    #
    # Require windows libs
    #
    def require_windows_libs
      require 'Win32/Console/ANSI' if RUBY_VERSION < '2.0.0' && RUBY_PLATFORM =~ /win32/
    rescue LoadError
      raise 'You must gem install win32console to use decor on Windows'
    end
  end
end
