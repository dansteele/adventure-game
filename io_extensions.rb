module IOExtensions

  POSITIVE_ANSWERS = %w(
    y
    yes
    totes
  )

  def say(sentance, options = nil, color: :white)
    puts
    sleep 0.5 unless $debug
    puts sentance.colorize(color)
    puts options.join("  ") if options
  end

  def ask(type, question, selection=nil)
    say question, selection
    return random_answer(type, question, selection) if $debug
    ans = gets.strip.chomp.downcase
    return positive_answer?(ans) if type == :bool
    return selection_answer(question, ans, selection) if type == :select
    return ans if type == :text
  end

  def random_answer(type, question, selection=nil)
    return [true, false].sample if type == :bool
    return selection.sample.to_sym if type == :select
    return ("A".."Z").to_a.shuffle.take(6).join if type == :text
  end

  def selection_answer(question, ans, selection)
    if selection.include?(ans) || selection.map(&:to_s).include?(ans)
      return ans.to_sym
    else
      puts "That doesn't sound right, try again"
      ask(:select, question, selection)
    end
  end

  def positive_answer?(ans)
    POSITIVE_ANSWERS.include? ans
  end
end