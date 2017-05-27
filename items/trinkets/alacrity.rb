class Alacrity < Trinket

  DESCRIPTION = "Grants truesight"

  def use
    say 'Next 2 attacks will not miss', color: :blue
    @hero.truesight += 2
  end

end
