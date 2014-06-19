require_relative "testing_library"

goal_message = "GOOOOOOOAL!!!!"
team_list = "Brazil, Mexico, Cameroon, Croatia, Netherlands, Chile, Australia, Spain, Germany, Ghana, US, Protugal"
long_string = <<-world_cup_news
  Clint, Dempsey, put, the, U.S.,
  ahead, in, the, first, minute,
  of, its, World, Cup, opener.
world_cup_news

# enter your solutions inside the methods
def goal(message)
  message + message
end

def generate_an_array_of_teams(teams)
  teams.split(', ')
end

def number_of_teams(teams)
  arr = teams.split(', ')
  arr.length
end

def return_australia(teams)
  arr = teams.split(', ')
  arr[6]
end

def starts_with_C(teams)
  return_arr = []
  arr = teams.split(', ')
  arr.each do |team|
    if team[0] == 'C'
      return_arr.push(team)
    end
  end
  return_arr
end

# def block_string_to_single_line(block_string)
#   block_string = block_string[2,96]
#   block_string = ((block_string.tr("\n ", "")).split(',')).join(" ")
# end

def block_string_to_single_line(block_string)
  block_string = block_string[2,96]
  block_string = ((block_string.tr("\n ", "")).tr(",", ' '))
end

def capitalize_every_third_word(block_string)
  block_string = block_string[2,96]
  block_string = ((block_string.tr("\n ", "")).split(','))
  word_counter = 0
  new_arr = []
  block_string.each do |word|
    if word_counter >= 4 || word_counter == 0
      word_counter = 1
      word.capitalize!
    else
      word.downcase!
    end
    word_counter += 1
    new_arr.push(word)
  end
  new_arr.join(' ')
end

p block_string_to_single_line(long_string)

check("goal method", goal(goal_message) == "GOOOOOOOAL!!!!GOOOOOOOAL!!!!")
check("generate_an_array_of_teams method",
      generate_an_array_of_teams(team_list) == ["Brazil", "Mexico", "Cameroon", "Croatia", "Netherlands", "Chile", "Australia", "Spain", "Germany", "Ghana", "US", "Protugal"] )
check("number_of_teams method", number_of_teams(team_list) == 12 )
check("return_australia method", return_australia(team_list) == 'Australia' )
check("starts_with_C method", starts_with_C(team_list) == ['Cameroon', 'Croatia', 'Chile'] )
check("block_string_to_single_line method",
      block_string_to_single_line(long_string) == "Clint Dempsey put the U.S. ahead in the first minute of its World Cup opener." )
check("capitalize_every_third_word method",
      capitalize_every_third_word(long_string) == "Clint dempsey put The u.s. ahead In the first Minute of its World cup opener." )

