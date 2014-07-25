class UserMailer < ActionMailer::Base

  default from: "from@example.com"

  def registration_confirmation(user)
  	mail(:to => "#{user.name} <#{user.email}, :subject => "registered")
  	@user = user
  	#attachements["rails.png"] = File.read("#{Rails.root}/public/images.png")
  	end
end
