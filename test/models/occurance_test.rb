require 'test_helper'

class OccuranceTest < ActiveSupport::TestCase
  test "validations" do

    no_at = Occurance.new(severity: -2, event_id: events(:good_mood).id)
    assert_not no_at.valid?, "When is required for occurances"

    no_event = Occurance.new(severity: 9, at: 1523405866)
    assert_not no_event.valid?, "Event id is required for occurances"

    no_severity_mood = Occurance.new(event_id: events(:good_mood).id, at: 1523405866)
    assert_not no_severity_mood.valid?, "Severity is required for occurances"

    activity_severity = Occurance.new(event_id: events(:activity).id, at: 1523405866, severity: 0)
    assert activity_severity.valid?, "Severity can be zero for activities"

    mood_severity = Occurance.new(event_id: events(:good_mood).id, at: 1523405866, severity: 0)
    assert_not mood_severity.valid?, "Severity can't be zero for moods"

    out_of_range_severity = Occurance.new(event_id: events(:good_mood).id, at: 1523405866, severity: 19)
    assert_not out_of_range_severity.valid?, "Severity can't be out of range"
  end
end
