class Room

  include IOExtensions

  def initialize(level, hero, debug = false)
    @debug = debug
    @hero = hero
    @level = level
    say "#{@hero.name} has entered a new room"
    fight_monster
  end

  def fight_monster
    monster = create_monster(Orc, @level)
    Fight.new(@hero, monster)
  end

  def create_monster(type, level)
    type.new(level)
  end

end