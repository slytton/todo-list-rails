# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Set serialization adapter
ActiveModelSerializers.config.adapter = :json_api