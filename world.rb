# Person class
require 'pry'


# Politician class

class Politician

  attr_accessor :name, :party

  @@party = ["Democrat", "Republican"]

  def initialize(name, party)
    @name = name
    @party = party
  end

  def info
    puts "Politician:"
    puts "#{@name}: #{@party}"
  end


end

# Voter class

class Voter

  attr_accessor :name, :affiliation

  @@political_affiliation = ["Liberal", "Conservative", "Tea Party", "Socialist", "Neutral"]


  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation
  end

  def info
    puts "Voter:"
    puts "#{@name}: #{@affiliation}"
  end

  def self.affiliation
    p @@political_affiliation
  end
end



# Game class

class Game

  attr_reader :voters, :politicians

  def initialize
    @voters = []
    @politicians = []
  end

  def add_voter(name, affiliation)
    @voters << Voter.new(name, affiliation)
  end

  def add_politician(name, party)
    @politicians.push(Politician.new(name, party))
  end

  def voter_list
    puts
    puts "Voter Registration Roll:"
    @voters.each do |voter|
      puts "#{voter.name}: #{voter.affiliation}"
    end
    puts
  end

  def politician_list
    puts
    puts "List of Politicians:"
    @politicians.each do |politician|
      puts "#{politician.name}: #{politician.party}"
    end
    puts
  end

  # starts the simulator
  def start
    puts "Welcome to the Voter Simulation!"
    puts "What would you like to do?"
    puts "(1) Create, (2) List, (3) Update, (4) Delete"
    action = gets.chomp.to_i
    if action == 1
      # create politician or voter
      create
    elsif action == 2
      # List politicians and voters
      puts "Which group would you like listed? (1) Politicians, (2) Voters"
      choice = gets.chomp.to_i
      if choice == 1
        politician_list
      elsif choice == 2
        voter_list
      end
    elsif action == 3
      # Update
      update
    elsif action == 4
      delete
    else
      puts "Invalid selection. Try again."
      start
    end
    start
  end

  # used to create a politician or a voter
  def create
    puts "What type of character would you like to create?"
    puts "(1) Politician, (2) Voter"
    create_choice = gets.chomp.to_i
    if create_choice == 1
      puts "What is the politician's name?"
      name = gets.chomp
      puts "Party? (1) Republican, (2) Democrat"
      party = gets.chomp.to_i
      if party == 1
        party = "Republican"
      elsif party == 2
        party = "Democrat"
      else
        puts "Invalid selection"
        create
      end
      add_politician(name, party)
    elsif create_choice == 2
      puts "What is the voter's name?"
      name = gets.chomp
      puts "What is the voter's political affiliation?"
      Voter.affiliation
      affiliation = gets.chomp
      add_voter(name, affiliation)
    else
      puts "Invalid selection. Try again"
      create
    end
    start
  end

  def update
    puts "Which group would you like to update? (1) Politician, (2) Voter"
    choice = gets.chomp.to_i
    case choice
    when 1
      puts "Which politician would you like to update?"
      name = gets.chomp
      politician = @politicians.find{ |politician| politician.name == name }
      if politician.nil?
        puts "#{name} is not listed."
      else
        puts "What party would you like to update #{name} to follow?"
        party = gets.chomp
        politician.party = party
      end
    when 2
      puts "Which Voter would you like to update?"
      name = gets.chomp
      voter = @voters.find{ |voter| voter.name == name }
      if voter.nil?
        puts "#{name} is not listed."
      else
        puts "What affiliation would you like to update #{name} to follow?"
        affiliation = gets.chomp
        voter.affiliation = affiliation
      end
    else
      puts "Invalid selection. Try again."
      update
    end
    start
  end

  def delete
    puts "Which group would you like to delete from? (1) Politician, (2) Voter"
    choice = gets.chomp.to_i
    case choice
    when 1
      puts "Which Politician would you like to delete?"
      name = gets.chomp
      politician = @politicians.find{ |politician| politician.name == name }
      if politician.nil?
        puts "#{politician} not listed"
      else
        @politicians.delete(politician)
      end
    when 2
      puts "Which Voter would you like to delete?"
      name = gets.chomp
      voter = @voters.find{ |voter| voter.name == name }
      if voter.nil?
        puts "#{voter} not listed"
      else
        @voters.delete(voter)
      end
  end
  start
end


end

game = Game.new
game.start
