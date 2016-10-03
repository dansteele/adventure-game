class Fight

  include IOExtensions

  def initialize(hero, monster)
    @hero = hero
    @monster = monster
    begin_fight
  end

  def begin_fight
    say "A #{@monster.name} appeared!"
    fight until @monster.dead? || @hero.dead?
    return win if @monster.dead?
    lose if @hero.dead?
  end

  def win
    say "You defeated the #{@monster.name}", color: :green
    Room.new(@hero.level += 1, @hero)
  end

  def lose
    say "The #{@monster.name} killed you :(", color: :red
    say "You made it to level #{@hero.level}"
  end

  def fight
    say "You have #{@hero.hp} hp"
    say "The #{@monster.name} has #{@monster.hp} hp"
    hero_attack
    monster_attack
  end

  def hero_attack
    attack_type = ask(:select, "How do you want to attack", @hero.attack_options.keys)
    say "You try and hit the #{@monster.name} with a #{attack_type} attack", color: :blue
    @hero.attack(@monster, attack_type)
  end

  def monster_attack
    attack_type = @monster.attack_options.keys.sample
    say "The #{@monster.name} tries to attack you with a #{attack_type} attack"
    @monster.attack(@hero, attack_type)
  end
  
end