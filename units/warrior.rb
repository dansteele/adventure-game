class Warrior < Unit

  ENEMY = false
  BASE_HEALTH = 100

  def initialize(name: 'Warrior', level:)
    super(klass: self.class, name: name, level: level)
  end

  def attack_options
    {
      slow: {
        accuracy: 0.4,
        damage: 1.5
      },
      medium: {
        accuracy: 0.7,
        damage: 1
      },
      fast: {
        accuracy: 0.9,
        damage: 0.6
      }
    }.with_indifferent_access
  end

end