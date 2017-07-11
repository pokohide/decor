require File.expand_path('decor/version', File.dirname(__FILE__))
require File.expand_path('decor/const', File.dirname(__FILE__))
require File.expand_path('decor/class_methods', File.dirname(__FILE__))
require File.expand_path('decor/instance_methods', File.dirname(__FILE__))

#
# String class extension.
#
class String
  extend Decor::ClassMethods
  include Decor::InstanceMethods

  color_methods
  modes_methods
end