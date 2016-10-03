class Paladin < Unit

  ENEMY = true
  BASE_HEALTH = 12

  def initialize(level)
    super(klass: self.class, name: 'Paladin', level: level)
  end

  def attack_options
    {
      slow: {
        accuracy: 0.4,
        damage: 2
      },
      medium: {
        accuracy: 0.7,
        damage: 1.5
      },
      fast: {
        accuracy: 0.9,
        damage: 1
      }
    }.with_indifferent_access
  end

end