require 'put_data'
class Pet
  attr_accessor :eat
  attr_accessor :drink
  attr_accessor :play
  attr_accessor :ws
  attr_accessor :sleep_rate
  attr_accessor :life
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

  puts  "This is " + @name + " he(she) " + @kind +", take care of him(her)!" end

  def eat_
    if (@eat > 7)
      puts "I don't hungry!"
    else
      puts @name + " is eating food now."
      @eat = 11
  end
    emulator
    asleep
  end

  def drink_
    if (@drink > 7)
      puts "I don't want to drink !"
    else
      puts @name + " drinks water."
      @drink = 11
  end
    emulator
    asleep
  end

  def play_
    if (@play > 7)
      puts @name + " don't want to play."
    else
      puts @name + " is play now."
      @play = 11
    end
    emulator
    asleep
  end

  def ws_
    if (@ws > 5)
      puts @name + " doesn't want to go to the toilet."
    else
      puts @name + " going to the toilet."
      @ws = 11
    end
    emulator
    asleep
  end

  def sleep_
    puts  @name + " go to sleep."
    @sleep = true
    4.times do
      if @sleep
        @sleep_rate = 11
        emulator
      end
      if @sleep
        puts @name + " is sleeping good."
      end
    end
    if @sleep
      @sleep = false
      puts @name + " is woke up and ready for new accomplishments."
    end
  end

  def stats
    puts "Hunger: #{@eat}"
    puts "Sleep: #{@sleep_rate}"
    puts "Mood: #{@play}"
    puts "Thirst: #{@drink}"
    puts "Toilet: #{@ws}"
    puts "Life: #{@life}"
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

    @emoji_eat = ''
    @emoji_play = ''
    @emoji_sleep_rate = ''
    @emoji_drink = ''
    @emoji_ws = ''
    @emoji_life = ''

    if (@eat > 0)
      @eat -= 1
      @emoji_eat = "<img src = 'emoji/1.png' weight: 145px height = 145px>"
    else
      if @sleep
        @sleep = false
        puts @name + " woke up."
      end
      @life -= 1
      puts "Your animal has #{@life} life."
      @eat = 2
      if @life == 0
        puts "You were a bad master and yours " + @name + " ran away from you."
        @emoji_life = "<img src = 'emoji/2.png' weight: 145px height = 145px>"
        exit
      end
    end


    if (@drink > 0)
      @drink -= 1
      @emoji_drink = "<img src = 'emoji/11.png' weight: 145px height = 145px>"
    else
      @life -= 1
      puts "Your animal has #{@life} life."
      @drink = 2
      if @life == 0
        puts "Your pet died from dehydration!"
        @emoji_life = "<img src = 'emoji/3.png' weight: 145px height = 145px>"
        exit
      end
    end

    if thirst?
      if @sleep
        @sleep = false
        puts @name + " woke up."
      end
      puts "Your animal really wants to drink."
      @emoji_drink = "<img src = 'emoji/4.png' weight: 145px height = 145px>"
    end

    if hungry?
      if @sleep
        @sleep = false
        puts @name + " woke up."
      end
      puts "Your animal is very hungry."
      @emoji_eat = "<img src = 'emoji/5.png' weight: 145px height = 145px>"
    end

    if toilet?
      if @sleep
        @sleep = false
        puts @name + " woke up."
      end
      puts "Your animal really wants to go to the toilet."
      @emoji_ws = "<img src = 'emoji/6.png' weight: 145px height = 145px>"
    end

    if (@play > 0)
      @play -= 1
    end

    if (@ws > 0)
      @ws -= 1
    end

    if sums?
      puts @name + " very sad, play with it."
      @emoji_play = "<img src = 'emoji/7.png' weight: 145px height = 145px>"
    end

    if sleep_rate?
      puts @name + " sleepy, put him to sleep."
      @emoji_sleep_rate = "<img src = 'emoji/8.png' weight: 145px height = 145px>"
    end

    if @sleep_rate == 0
      puts @name + " fell asleep due to lack of energy."
      @emoji_sleep_rate = "<img src = 'emoji/9.png' weight: 145px height = 145px>"
      @sleep_rate = 11
    end

    if @ws == 0
      puts @name + " went to the toilet where it was convenient, remove it."
        @emoji_ws = "<img src = 'emoji/10.png' weight: 145px height = 145px >"
      @ws = 11
    end

    content = "<p>Life: #{@life}</p> #{@emoji_life}
      <p>Indicator of hunger: #{@eat}</p> #{@emoji_eat}
      <p>Indicator of playfulness: #{@play}</p>#{@emoji_play}
      <p>Indicator of sleep: #{@sleep_rate}</p>#{@emoji_sleep_rate}
      <p>Indicator of thirst: #{@drink}</p>#{@emoji_drink}
      <p>Indicator of toilet: #{@ws}</p> #{@emoji_ws}"

    Put.test content, true
end

puts "Enter the name of the animal:"
name = gets.chomp
puts "Enter kaind of animal (cat, dog, hamster ...):"
kind = gets.chomp


pet = Pet.new name, kind
puts "1 - to feed"
puts "2 - to play"
puts "3 - put to bed"
puts "4 - to drink"
puts "5 - erect in the toilet"
puts "6 - statistics"
puts "7 - help"
puts "8 - exit"

sw = 0

 while sw != 8
   sw = gets.to_i
   case sw
   when 1
     pet.eat_
   when 2
     pet.play_
   when 3
     pet.sleep_
   when 4
     pet.drink_
   when 5
     pet.ws_
   when 6
     pet.stats
   when 7
     puts "1 - to feed"
     puts "2 - to play"
     puts "3 - put to bed"
     puts "4 - to drink"
     puts "5 - erect in the toilet"
     puts "6 - statistics"
     puts "7 - help"
     puts "8 - exit"
   end
 end
