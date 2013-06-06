class UserMailer < ActionMailer::Base
  default from: "noreply@example.com"

  def spark_reminder(user)
    @user = user
    mail to: user.email, subject: "Friendly Reminder"
  end

end
