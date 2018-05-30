require './lib/activity.rb'

class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum {|activity| activity.total_cost}
  end

  def calculate_total_owed_per_person
    @activities.map {|activity| activity.owed_by_individuals}
  end

  def breakdown_of_payments
    calculate_total_owed_per_person.inject({}) {|collector, payment| collector.merge(payment)}
  end

  def print_out_amount_owed
    breakdown_of_payments.each {|name, amount_owed| puts "#{name} owes #{amount_owed}"}
  end
end
