class Critical < Trinket

  DESCRIPTION = "The next 3 attacks will hit for 3x damage if they hit"

  def use
    say 'Get ready for some crits!', color: :blue
    @hero.criticals.push *[3, 3, 3]
  end

end