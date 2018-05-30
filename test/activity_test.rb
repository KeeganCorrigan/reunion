require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Skiing", 100, 50)
    assert_instance_of(Activity, activity)
  end

  def test_it_has_attributes
    activity = Activity.new("Skiing", 100, 50)
    assert_equal "Skiing", activity.type
    assert_equal 100, activity.base_cost
    assert_equal 50, activity.cost_per_participant
  end

  def test_add_participants
    activity = Activity.new("Skiing", 100, 50)
    assert_equal 0, activity.participants.length
    activity.add_participants("Billy", 50)
    assert_equal 1, activity.participants.length
    assert_equal 50, activity.participants["Billy"]
  end

  def test_total_cost
    activity = Activity.new("Skiing", 100, 50)
    activity.add_participants("Billy", 50)
    assert_equal 150, activity.total_cost
  end

  def test_calculate_fair_share
    activity = Activity.new("Skiing", 100, 50)
    activity.add_participants("Billy", 50)
    activity.add_participants("Jimothy", 50)
    activity.add_participants("Barbaritha", 50)
    assert_equal 83, activity.calculate_fair_share
  end

  def test_calculate_total_paid_compared_to_total_owed
    activity = Activity.new("Skiing", 100, 50)
    activity.add_participants("Billy", 50)
    activity.add_participants("Jimothy", 90)
    activity.add_participants("Barbaritha", 83)
    assert_equal Hash, activity.owed_by_individuals.class
    assert_equal 33, activity.owed_by_individuals["Billy"]
  end
end
