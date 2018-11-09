Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.precompile += %w(admin/*.js)
Rails.application.config.assets.precompile += %w(app.js)
Rails.application.config.assets.precompile += %w(app.css)
