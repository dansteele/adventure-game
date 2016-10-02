class Warrior < Unit

  BASE_HEALTH = 100

  def initialize(name: 'Warrior', level: level)
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

  def attack(target, attack_option)
    target.receive_damage(calc_damage(attack_option), self) if was_hit?(attack_option)
  end

  def was_hit?(attack_option)
    attack_options[attack_option][:accuracy] > rand(0.0..1.0)
  end

  def calc_damage(attack_option)
    (rand(0.95..1.05) * (@level * attack_options[attack_option][:damage])).round(2)
  end

end