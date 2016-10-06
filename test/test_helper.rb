require 'minitest/autorun'

Dir.glob(File.expand_path('../../lib', __FILE__) + '/**/*.rb') do |file|
  require file
end
