class Archer < Unit

  ENEMY = false
  BASE_HEALTH = 40

  def initialize(name: 'Archer', level:)
    super(klass: self.class, name: name, level: level)
  end

  def attack_options
    {
      slow: {
        accuracy: 0.3,
        damage: 3
      },
      medium: {
        accuracy: 0.7,
        damage: 1.5
      },
      fast: {
        accuracy: 0.9,
        damage: 0.8
      }
    }.with_indifferent_access
  end

end