require 'simplecov'
require 'webmention/endpoint'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

Dir.glob(File.join(Dir.pwd, 'spec', 'support', '**', '*.rb')).sort.each { |f| require f }
