class ReminderForUsersWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      ReminderWorker.perform_async(user.id)
    end
  end
end
