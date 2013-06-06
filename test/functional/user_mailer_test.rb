require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "spark_reminder" do
    mail = UserMailer.spark_reminder
    assert_equal "Spark reminder", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end