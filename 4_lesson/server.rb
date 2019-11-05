require "sinatra"
require "sinatra/reloader" if development?
require 'yaml'

class Pet
  attr_accessor :name
  attr_accessor :kind
  attr_accessor :eat
  attr_accessor :drink
  attr_accessor :play
  attr_accessor :ws
  attr_accessor :sleep_rate
  attr_accessor :life
  attr_accessor :text
  attr_accessor :text_thirst
  attr_accessor :text_sums
  attr_accessor :text_hungry
  attr_accessor :text_toilet
  attr_accessor :text_sleep_rate
  attr_accessor :text_ws
  attr_accessor :text_life
  attr_accessor :text_animal

  def initialize
    yml = YAML.load(File.read('database.yml'))
    @name = yml[:name]
    @kind = yml[:kind]
    @sleep = false
    @eat = yml[:eat]
    @drink = yml[:drink]
    @play = yml[:play]
    @ws = yml[:ws]
    @sleep_rate = yml[:sleep_rate]
    @life = yml[:life]

  @text_animal =  "This is #{@name} he(she) #{@kind}, take care of him(her)!"
end

  def feed
    if (@eat > 7)
      @text = "I don't hungry!"
    else
      @text = "#{@name} is eating food now."
      @eat = 11
  end
    emulator
    asleep
  end

  def drink_
    if (@drink > 7)
      @text = "I don't want to drink !"
    else
      @text = "#{@name} drinks water."
      @drink = 11
  end
    emulator
    asleep
  end

  def play_
    if (@play > 7)
      @text = "#{@name} don't want to play."
    else
      @text = "#{@name} is play now."
      @play = 11
    end
    emulator
    asleep
  end

  def ws_
    if (@ws > 5)
      @text = "#{@name} doesn't want to go to the toilet."
    else
      @text = "#{@name} going to the toilet."
      @ws = 11
    end
    emulator
    asleep
  end

  def sleep_
    @text = "#{@name} go to sleep."
    @sleep_rate = 10
    4.times do
        emulator
      end
      @text += " #{@name} is woke up and ready for new accomplishments."
  end

  def stats
    puts "Hunger: #{@eat}"
    puts "Sleep: #{@sleep_rate}"
    puts "Mood: #{@play}"
    puts "Thirst: #{@drink}"
    puts "Toilet: #{@ws}"
    puts "Life: #{@life}"
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
      @life -= 1
      puts "Your animal has #{@life} life."
      @eat = 2
      if @life == 0
        @text_life = "You were a bad master and yours #{@name} ran away from you."
        exit
      end
    end

    if (@drink > 0)
      @drink -= 1
    else
      @life -= 1
      @text_life = "Your animal has #{@life} life."
      @drink = 2
      if @life == 0
        @text_life = "Your pet died from dehydration!"
        exit
      end
    end

    if thirst?
      @text_thirst = "Your animal really wants to drink."
    else
      @text_thirst = ""
    end

    if hungry?
      @text_hungry = "Your animal is very hungry."
    else
      @text_hungry = ""
    end

    if toilet?
      @text_toilet = "Your animal really wants to go to the toilet."
    else
      @text_toilet = ""
    end

    if (@play > 0)
      @play -= 1
    end

    if (@ws > 0)
      @ws -= 1
    end

    if sums?
      @text_sums = "#{@name} very sad, play with it."
    else
      @text_sums = ""
    end

    if sleep_rate?
      @text_sleep_rate = "#{@name} sleepy, put him to sleep."
    else
      @text_sleep_rate = ""
    end

    if @sleep_rate == 0
      @sleep_rate = 10
      @text_sleep_rate = "#{@name} fell asleep due to lack of energy."
    else
      @text_sleep_rate = ""
    end

    if @ws == 0
      @ws = 11
      @text_ws = "#{@name} went to the toilet where it was convenient, remove it."
    else
      @text_ws = ""
    end
  end
end


get '/' do
 erb :index
end

animal_pet = Pet.new

post '/tamagochi' do
  animal = {name: params[:Name].to_s,
            kind: params[:Kind].to_s,
            life: 3,
            eat: 10,
            drink: 10,
            play: 10,
            ws: 10,
            sleep_rate: 10}
  File.open("database.yml", "w") { |file| file.write(animal.to_yaml) }
  animal_pet = Pet.new
  erb :start
end

post '/tamagochi/start' do
  @eat_food = animal_pet.eat
  @drink_water = animal_pet.drink
  @plaing = animal_pet.play
  @go_to_the_toilet = animal_pet.ws
  @sleep = animal_pet.sleep_rate
  @life_animal = animal_pet.life
  @text = animal_pet.text
  @text_sums = animal_pet.text_sums
  @text_hungry = animal_pet.text_hungry
  @text_thirst = animal_pet.text_thirst
  @text_toilet = animal_pet.text_toilet
  @text_ws = animal_pet.text_ws
  @text_sleep_rate = animal_pet.text_sleep_rate
  @text_life = animal_pet.text_life
  @text_animal = animal_pet.text_life
  erb :play
end

post '/tamagochi/start/eat' do
  animal_pet.feed
  redirect '/tamagochi/start', 307
end

post '/tamagochi/start/drink' do
  animal_pet.drink_
  redirect '/tamagochi/start', 307
end

post '/tamagochi/start/play' do
  animal_pet.play_
  redirect '/tamagochi/start', 307
end

post '/tamagochi/start/ws' do
  animal_pet.ws_
  redirect '/tamagochi/start', 307
end

post '/tamagochi/start/sleep' do
  animal_pet.sleep_
  redirect '/tamagochi/start', 307
end
