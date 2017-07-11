module Decor
  module ClassMethods

    #
    # Return array of available colors used by colorize
    #
    def colors
      COLORS.keys
    end

    #
    # Return array of available modes used by colorize
    #
    def modes
      MODES.keys
    end

    #
    # Display color samples
    #
    def color_samples
      COLORS.permutation(2).each do |background, color|
        sample_text = "#{color.inspect.rjust(15)} on #{background.inspect.ljust(15)}"
        puts "#{new(sample_text).colorize(:color => color, :background => background)} #{sample_text}"
      end
    end

    #
    # Generate color and on_color methods
    #
    def color_methods
      colors.each do |color|
        next if color == :default

        define_method color do
          decor(color: color)
        end

        define_method "on_#{color}" do
          decor(background: color)
        end
      end
    end

    #
    # Generate modes methods
    #
    def modes_methods
      modes.each do |mode|
        next if mode == :default

        define_method mode do
          decor(mode: mode)
        end
      end
    end
  end
end