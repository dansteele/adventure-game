class Orc < Unit

  BASE_HEALTH = 8

  def initialize(level)
    super(klass: self.class, name: 'Orc', level: level)
  end

  def attack
    @level * rand(1..5)
  end
end