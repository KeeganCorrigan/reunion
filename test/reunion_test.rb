require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def setup


  end
  def test_it_exists
    reunion = Reunion.new(location)
    assert_instance_of(Reunion, reunion)
  end

  def test_it_has_a_location
    reunion = Reunion.new("Middle of Kansas")
    assert_equal "Middle of Kansas",  reunion.location
  end

  def test_you_can_add_activities
    reunion = Reunion.new("Middle of Kansas")
    activity = Activity.new("Hijacking cars", 100, 70)
    assert_equal Array, reunion.activities.class
    assert_equal 0, reunion.activities.length
    reunion.add_activity(activity)
    assert_equal Activity, reunion.activities.first.class
    assert_equal "Hijacking cars", reunion.activities.first.type
  end

  def test_total_cost_of_reunion
    reunion = Reunion.new("Middle of Kansas")
    activity_1 = Activity.new("Hijacking cars", 100, 70)
    activity_1.add_participants("Billy", 50)
    activity_1.add_participants("Jimothy", 190)
    activity_2 = Activity.new("Speedboat jousting", 50, 70)
    activity_2.add_participants("Jimothy", 190)
    activity_2.add_participants("Samuelellisoncomacho", 13)
    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    assert_equal 430, reunion.total_cost
  end

  def test_calculate_total_owed_per_person
    reunion = Reunion.new("Middle of Kansas")
    activity_1 = Activity.new("Hijacking cars", 100, 70)
    activity_1.add_participants("Billy", 50)
    activity_1.add_participants("Jimothy", 190)
    activity_2 = Activity.new("Speedboat jousting", 50, 70)
    activity_2.add_participants("Jimothy", 190)
    activity_2.add_participants("Samuelellisoncomacho", 13)
    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    assert_equal Array, reunion.calculate_total_owed_per_person.class
    assert_equal 70, reunion.calculate_total_owed_per_person[0]["Billy"]
  end

  def test_breakdown_of_payments
    reunion = Reunion.new("Middle of Kansas")
    activity_1 = Activity.new("Hijacking cars", 100, 70)
    activity_1.add_participants("Billy", 50)
    activity_1.add_participants("Jimothy", 190)
    activity_2 = Activity.new("Speedboat jousting", 50, 70)
    activity_2.add_participants("Jimothy", 190)
    activity_2.add_participants("Samuelellisoncomacho", 13)
    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    assert_equal Hash, reunion.breakdown_of_payments.class
    assert_equal 70, reunion.breakdown_of_payments["Billy"]
  end

  def test_print_out_amount_owed
    reunion = Reunion.new("Middle of Kansas")
    activity_1 = Activity.new("Hijacking cars", 100, 70)
    activity_1.add_participants("Billy", 50)
    activity_1.add_participants("Jimothy", 190)
    activity_2 = Activity.new("Speedboat jousting", 50, 70)
    activity_2.add_participants("Jimothy", 190)
    activity_2.add_participants("Samuelellisoncomacho", 13)
    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    assert_equal Hash, reunion.print_out_amount_owed.class
  end
end
