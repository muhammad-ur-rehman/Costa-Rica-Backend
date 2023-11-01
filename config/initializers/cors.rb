# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # You can restrict this to specific domains in a production environment
      resource '/graphql', headers: :any, methods: [:get, :post, :options]
    end
 end
