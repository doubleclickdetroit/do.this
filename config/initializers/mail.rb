EMAIL = 'foo@example.com' # TODO

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "example.com", # TODO
    :user_name            => EMAIL,
    :password             => ENV['EMAIL_PASSWORD'], # TODO
    :authentication       => "plain",
    :enable_starttls_auto => true
  }
end
