require './dependencies'

class Game
  include IOExtensions

  attr :debug


  def initialize
    puts "Enable debug? y/n"
    ans = gets.strip.chomp
    @debug = true if positive_answer?(ans)
  end

  def start
    @hero = create_player
    Room.new(1, @hero, @debug)
  end

  def create_player
    say "Welcome to the world of adventure"
    name = ask(:text, "What's your name?")
    hero = ask(:select, "What kind of hero are you?", %w(warrior))
    hero.to_s.camelize.constantize.new(name: name, level: 1)
  end

end

Game.new.start