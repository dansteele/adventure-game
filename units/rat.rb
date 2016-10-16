class Rat < Unit

  ENEMY = true
  BASE_HEALTH = 2
  DEATH_EXP = 15

  def initialize(level)
    super(klass: self.class, name: 'Rat', level: level)
  end

  def attack_options
    {
      fast: {
        accuracy: 0.95,
        damage: 0.2
      }
    }.with_indifferent_access
  end

end