class Item
  
  include IOExtensions

  def initialize(hero)
    @hero = hero
  end

  def describe
    self.class.const_get :DESCRIPTION
  end

end