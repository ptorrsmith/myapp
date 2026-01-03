# By default, Ruby buffers output to stdout, which doesn’t play well with Compose.
#  Let’s fix this by switching off Ruby’s output buffering.
$stdout.sync = true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
