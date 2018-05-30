class Activity
  attr_reader :type,
              :base_cost,
              :cost_per_participant,
              :participants

  def initialize(type, base_cost, cost_per_participant)
    @type = type
    @base_cost = base_cost
    @cost_per_participant = cost_per_participant
    @participants = {}
  end

  def add_participants(name, payment)
    @participants[name] = payment
  end

  def total_cost
    (@participants.length * cost_per_participant) + base_cost
  end

  def calculate_fair_share
    ((@participants.length * cost_per_participant) + base_cost) / @participants.length
  end

  def owed_by_individuals
    (@participants.inject({}) { |participant, (name, paid)| participant[name] = (paid - (total_cost / @participants.length)) * -1; participant })
  end
end
