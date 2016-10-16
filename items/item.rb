class Item

  include IOExtensions

  def initialize(hero)
    @hero = hero
  end

  def find
    say 'You found an item!', color: :green
    say self.class::DESCRIPTION
    use
  end

end