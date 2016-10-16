class Trinket < Item

  def self.random_trinket
    ObjectSpace.each_object(Class).select { |klass| klass < self }.sample
  end

end