require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "validations" do
    no_name = Event.new(category: 'activity')
    assert_not no_name.valid?, "Name is required for events"

    Event.create(category: 'activity', name: 'ate cheese')
    dupe_name = Event.new(category: 'activity', name: 'ate cheese')
    assert_not dupe_name.valid?, "Name must be unique for events"

    no_category = Event.new(name: 'went swimming')
    assert_not no_category.valid?, "Category is required for events"

    weird_category = Event.new(name: 'roller skated', category: 'bananas')
    assert_not weird_category.valid?, "Category can only be 'mood' or 'activity'"
  end
end
