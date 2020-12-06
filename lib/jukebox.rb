require 'pry'
def prompt_user
  puts "Please enter a command:"
end

def get_user_input
  gets.strip
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

def play(songs)
  puts "Please enter a song name or number:"
  user_input = get_user_input
  
  if user_input.to_i.between?(1,9)
    puts "#{songs[user_input.to_i - 1]}"
  elif songs.include?(user_input)
    puts "#{songs.find{|song| song == user_input}}"
  elsif
    puts "Invalid input, please try again"
    play(songs)
  end
end

def exit_jukebox
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
      play(songs)
    else
      help
    end
    user_input = get_user_input
  end
  exit_jukebox
end