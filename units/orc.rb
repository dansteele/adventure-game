class Orc < Unit

  ENEMY = true
  BASE_HEALTH = 5

  def initialize(level)
    super(klass: self.class, name: 'Orc', level: level)
  end

  def attack_options
    {
      slow: {
        accuracy: 0.4,
        damage: 1
      },
      medium: {
        accuracy: 0.7,
        damage: 0.7
      },
      fast: {
        accuracy: 0.9,
        damage: 0.3
      }
    }.with_indifferent_access
  end

end