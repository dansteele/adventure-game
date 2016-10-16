class Unit

  include IOExtensions

  attr_accessor :name, :hp, :level, :criticals

  def self.random_unit
    ObjectSpace.each_object(Class).select { |klass| klass < self && klass.const_get(:ENEMY) }.sample
  end

  def initialize(klass: nil, name: nil, level:)
    self.criticals = []
    @name = name
    @hp = klass.const_get(:BASE_HEALTH)
    @level = level
  end

  def is_hero?
    !self.class.const_get :ENEMY
  end

  def hp
    @hp.round(2)
  end

  def attack_options
    raise "This should be implemented"
  end

  def attack(target, attack_option)
    target.receive_damage(calc_damage(attack_option), self) if was_hit?(attack_option)
  end

  def was_hit?(attack_option)
    attack_options[attack_option][:accuracy] > rand(0.0..1.0)
  end

  def dead?
    @hp <= 0
  end

  def calc_damage(attack_option)
    (vary_float * (@level * attack_options[attack_option][:damage]) * crit).round(2)
  end

  def crit
    return 1 if @criticals.empty?
    say 'A critical hit!', color: :green
    @criticals.shift
  end

  def vary_float
    rand(0.95..1.05)
  end

  def receive_damage(amount, from)
    say "#{@name} took #{amount} damage from #{from.name}", color: (from.is_hero? ? :green : :red)
    @hp -= amount
  end

end