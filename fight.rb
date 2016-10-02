class Fight

  include IOExtensions

  def initialize(hero, monster)
    @hero = hero
    @monster = monster
    begin_fight
  end

  def begin_fight
    say "A #{@monster.name} appeared!"
    until @monster.dead? do fight end
    say "You win"
  end

  def fight
    say "The #{@monster.name} has #{@monster.hp} hp"
    attack_type = ask(:select, "How do you want to attack", @hero.attack_options.keys)
    say "You try and hit the #{@monster.name} with a #{attack_type} attack"
    @hero.attack(@monster, attack_type)
  end

end