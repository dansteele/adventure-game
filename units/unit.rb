class Unit

  include IOExtensions

  attr_accessor :name, :hp,:level

  def initialize(klass: nil, name: nil, level:)
    @name = name
    @hp = klass.const_get(:BASE_HEALTH)
    @level = level
  end

  def hp
    @hp.round(2)
  end

  def attack
    raise "This should be implemented"
  end

  def attack_options
    raise "This should be implemented"
  end

  def dead?
    @hp <= 0
  end

  def receive_damage(amount, from)
    say "#{@name} took #{amount} damage from #{from.name}"
    @hp -= amount
  end

end