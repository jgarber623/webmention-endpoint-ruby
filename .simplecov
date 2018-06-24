require 'simplecov-console'

formatters = [SimpleCov::Formatter::Console, SimpleCov::Formatter::HTMLFormatter]

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new(formatters)
end
