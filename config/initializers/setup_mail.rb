ActionMailer::Base.smtp_settings ={
	:address 	=> "smtp.gmail.com",
	:port 		=> 587, 
	:domain		=> "railscast.com", 
	:user_name	=> "secret", 
	:authentication	=> "plain", 
	:enable_starttis_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"