class Trinket < Item

  def self.random_trinket
    ObjectSpace.each_object(Class).select { |klass| klass < self }.sample
  end

  def name
    class_name = self.class.name
    VOWELS.include?(class_name.chars.first) ? "an #{class_name}" : "a #{class_name}"
  end

end
