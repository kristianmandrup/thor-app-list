require 'load-me'
require 'require-me'

# LoadPath.relative_to(__FILE__, '../../')
# LoadPath.add('lib')    

#require 'app_list'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'rspec/autorun'

