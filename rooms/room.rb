class Room

  include IOExtensions

  ITEM_SPAWN_CHANCE = 0.2

  def initialize(level, hero)
    @hero = hero
    @level = level
    Trinket.random_trinket.new(@hero).use if item_spawned?
    say "#{@hero.name} has entered a new room"

    fight_monster
  end

  def fight_monster
    monster = create_monster(Unit.random_unit, @level)
    Fight.new(@hero, monster)
  end

  def create_monster(type, level)
    type.new(level)
  end

  def item_spawned?
    rand(0.0..1.0) > ITEM_SPAWN_CHANCE
  end

end