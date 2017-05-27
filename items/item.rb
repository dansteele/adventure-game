class Item

  include IOExtensions

  def initialize(hero)
    @hero = hero
  end

  def find
    say "You found #{name}", color: :green
    say self.class::DESCRIPTION
    use
  end

  def name
    raise 'Implement me'
  end

end
