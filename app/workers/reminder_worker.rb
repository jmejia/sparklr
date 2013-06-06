class ReminderWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.spark_reminder(user).deliver
  end
end
