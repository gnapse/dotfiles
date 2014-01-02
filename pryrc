require "rubygems"

# Launch Pry with access to the entire Rails stack.
rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  rails_major_version = Rails.version[0..0].to_i

  if rails_major_version == 2
    require 'console_app'
    require 'console_with_helpers'
  elsif rails_major_version >= 3
    require 'rails/console/app'
    require 'rails/console/helpers'
    extend Rails::ConsoleMethods if Rails.version.to_f >= 3.2
  else
    warn "[WARN] cannot load Rails console commands"
  end
end
