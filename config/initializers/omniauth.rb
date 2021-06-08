Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['155870277355-9v0mgjsjc9v6sbcpb6b2r4f2n9s8the6.apps.googleusercontent.com'], ENV['ElU47VOJz2T6tO0Ly4gyZfJu']
  end
  OmniAuth.config.allowed_request_methods = %i[get]