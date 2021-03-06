# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# CSS
Rails.application.config.assets.precompile += %w( sign_in.css )
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( host_game.css )
Rails.application.config.assets.precompile += %w( game.css )
Rails.application.config.assets.precompile += %w( message.css )

#JS
Rails.application.config.assets.precompile += %w( sign_in.js )
Rails.application.config.assets.precompile += %w( welcome.js )
Rails.application.config.assets.precompile += %w( host_game.js )
Rails.application.config.assets.precompile += %w( game.js )
Rails.application.config.assets.precompile += %w( message.js )
Rails.application.config.assets.precompile += %w( custom_game.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
