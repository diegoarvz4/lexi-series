require 'test_helper'

class SeriesMailerTest < ActionMailer::TestCase
  test "series_invitation" do
    mail = SeriesMailer.series_invitation
    assert_equal "Series invitation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "translation_assignment" do
    mail = SeriesMailer.translation_assignment
    assert_equal "Translation assignment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "qc_revised" do
    mail = SeriesMailer.qc_revised
    assert_equal "Qc revised", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
