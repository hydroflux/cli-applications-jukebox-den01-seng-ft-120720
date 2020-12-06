require 'pry'
def prompt_user
  puts "Please enter a command:"
end

def get_user_input
  gets.strip.downcase
end

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index {|song, index|
    index += 1
    puts "#{index}. #{song}"
  }
end

def play(songs, user_input)
  songs.each_with_index {|song, index|
    index += 1
    if index == user_input
      puts "#{song}"
    end
  }
end

def exit_application
  puts "Goodbye!"
end

def run(songs)
  prompt_user
  user_input = get_user_input
  while user_input != "exit"
    if user_input == "help"
      help
    elsif user_input == "list"
      list(songs)
    elsif user_input == "play"
      evaluate_user_input(user_input)
    elsif user_input.between?(1..9)
      play(songs, user_input)
    else
      user_input = get_user_input
    end
  end
  exit_application
end