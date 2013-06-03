class DropboxWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    line_items = Dropbox::Service.lines_from_file(user.token, user.secret, "sparkfile.txt")

    sparks = TextParser.new(line_items).split_and_reverse
    Spark.save_from_text(sparks, user_id)
  end
end
