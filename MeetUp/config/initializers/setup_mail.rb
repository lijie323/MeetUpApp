ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "localhost:3000",
  :user_name            => "gaosong111111@gmail.com",
  :password             => "cspp52553",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
