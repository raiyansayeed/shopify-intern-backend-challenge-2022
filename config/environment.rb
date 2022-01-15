# Load the Rails application.
require_relative "application"

Rails.logger = Logger.new(STDOUT)
Rails.logger.level = Logger::DEBUG
Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

# Initialize the Rails application.
Rails.application.initialize!
