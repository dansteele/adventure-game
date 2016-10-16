class Salve < Trinket

  DESCRIPTION = "Heals for 15hp"

  def use
    say 'Health increased by 15', color: :blue
    @hero.hp += 15
  end

end