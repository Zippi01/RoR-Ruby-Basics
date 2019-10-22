class Pet
  def initialize name, kind
    @name = name
    @kind = kind
    @sleep = false
    @eat = 10
    @drink = 10
    @play = 10
    @ws = 10
    @sleep_rate = 10
    @life = 3

  puts  "Це " + @name + " він(вона) " + @kind +", піклуйся про нього(неї)!" end

  def eat
    if (@eat > 7)
      puts "Я ще не хочу їсти!"
    else
      puts @name + " їсть їжу."
      @eat = 11
  end
    emulator
    asleep
  end

  def drink
    if (@drink > 7)
      puts "Я ще не хочу пити!"
    else
      puts @name + " п'є воду."
      @drink = 11
  end
    emulator
    asleep
  end

  def play
    if (@play > 7)
      puts @name + " поки що не хоче гратись."
    else
      puts @name + " грається."
      @play = 11
    end
    emulator
    asleep
  end

  def ws
    if (@ws > 5)
      puts @name + " не хоче в туалет."
    else
      puts @name + " сходив(ла) в туалет."
      @ws = 11
    end
    emulator
    asleep
  end

  def sleep
    puts  @name + " засинає."
    @sleep = true
    4.times do
      if @sleep
        @sleep_rate = 11
        emulator
      end
      if @sleep
        puts @name + " спить хорошим сном."
      end
    end
    if @sleep
      @sleep = false
      puts @name + " прокинувся і готовий(а) до нових звершень."
    end
  end

  def stats
    puts "Голод: #{@eat}"
    puts "Сон: #{@sleep_rate}"
    puts "Настрій: #{@play}"
    puts "Спрага: #{@drink}"
    puts "Туалет: #{@ws}"
    puts "Життя: #{@life}"
  end
end

private

  def sleep_rate?
    @sleep_rate <= 3
  end

  def hungry?
    @eat <= 3
  end

  def thirst?
    @drink <= 3
  end

  def sums?
    @play <= 3
  end

  def toilet?
    @ws <= 3
  end

  def asleep
    if (@sleep_rate > 0)
      @sleep_rate -= 1
    end
  end

  def emulator

    if (@eat > 0)
      @eat -= 1
    else
      if @sleep
        @sleep = false
        puts @name + " прокинувся(лась)."
      end
      @life -= 1
      puts "У твоєї тваринки залишилося #{@life} життя."
      @eat = 2
      if @life == 0
        puts "Ти був поганим хазяїном і твій(твоя) " + @name + " втік(ла) від тебе."
        exit
      end
    end


    if (@drink > 0)
      @drink -= 1
    else
      @life -= 1
      puts "У твоєї тваринки залишилося #{@life} життя."
      @drink = 2
      if @life == 0
        puts "Твій улюбленець помер від зневоднення!"
        exit
      end
    end

    if thirst?
      if @sleep
        @sleep = false
        puts @name + " прокинувся(лась)."
      end
      puts "Твоя тваринка дуже хоче пить."
    end

    if hungry?
      if @sleep
        @sleep = false
        puts @name + " прокинувся(лась)."
      end
      puts "Твоя тваринка дуже голодна."
    end

    if toilet?
      if @sleep
        @sleep = false
        puts @name + " прокинувся(лась)."
      end
      puts "Твоя тваринка дуже хоче в туалет."
    end

    if (@play > 0)
      @play -= 1
    end

    if (@ws > 0)
      @ws -= 1
    end

    if sums?
      puts @name + " дуже сумний(а), пограйся з ним(нею)."
    end

    if sleep_rate?
      puts @name + " сонний(а), покладіть його(її) спати."
    end

    if @sleep_rate == 0
      puts @name + " заснув(ла) через нестачу енергії."
      @sleep_rate = 11
    end

    if @ws == 0
      puts @name + " сходив в туалет там де йому(їй) було зручно, прибери за ним(нею)."
      @ws = 11
    end
end

puts "Введіть ім'я тваринки:"
name = gets.chomp
puts "Введіть вид тваринки (наприклад: кіт, собака, хом'як...):"
kind = gets.chomp
pet = Pet.new name, kind
puts "1 - погодувати"
puts "2 - погратись"
puts "3 - покласти спати"
puts "4 - напоїти"
puts "5 - зводити в туалет"
puts "6 - статистика"
puts "7 - help"
puts "8 - exit"

sw = 0

 while sw != 8
   sw = gets.to_i
   case sw
   when 1
     pet.eat
   when 2
     pet.play
   when 3
     pet.sleep
   when 4
     pet.drink
   when 5
      pet.ws
   when 6
      pet.stats
   when 7
     puts "1 - погодувати"
     puts "2 - погратись"
     puts "3 - покласти спати"
     puts "4 - напоїти"
     puts "5 - зводити в туалет"
     puts "6 - статистика"
     puts "7 - help"
     puts "8 - exit"
   end
 end
