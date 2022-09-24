def start_cli
  puts "Hi there! Welcome to the Dog Walker CLI!".cyan
end
  
# ✅ add 2 additional options for walking and feeding dogs
def print_menu_options 

  puts "================================"
  puts "  1. List all dogs "
  puts "  2. Add a dog "
  puts ""
  puts "Type exit to exit out at anytime"
  puts "================================"
end
  
  
  
  # define a method `ask_for_choice` which prompts the user for input
  # if the user types "exit" we'll print a message thanking them
  # for using the CLI and invoke exit to terminate the program
  # otherwise, return whatever the user typed in

def ask_for_input
  user_input = gets.chomp

  if user_input === "exit"
    puts "Thank you for using this CLI have a nice day!"
    exit
  end

  user_input
end

# ✅ remove the print_dog method. We'll be using the Dog#print method instead
def print_dog(dog_hash)
  # js - `${}` ruby - "#{}"
  puts "#{dog_hash[:name]}".cyan
  puts "  Age: #{dog_hash[:age]}"
  puts "  Breed: #{dog_hash[:breed]}"
  puts "  Image URL: #{dog_hash[:image_url]}"
end

  
  
  # define a method `list_dogs` that will iterate over an array of
  # dog hashes and call print_dog on each one.
def list_dogs 
  $dogs.each do |dog_hash| 
    print_dog(dog_hash)
  end
  nil
end

  

# ✅ Refactor
# define an `add_dog` method which accepts an array of dog
# instances as an argument. It should:
# ask the user for input of the
# dog's name, age, breed and image_url. 
# Take this information and use it to create a new instance
# of the dog class 
# add the new instance to the dogs array passed as an argument
# print the newly added dog (by invoking dog.print)
  
def add_dog(dogs)
  puts "What's the Dog's name?  "
  name = ask_for_input
  puts "What's the Dog's Age?  "
  age = ask_for_input
  puts "What's the Dog's Breed?  "
  breed = ask_for_input
  puts "What's the Dog's Image Url?  "
  image_url = ask_for_input

  # ✅ Rework the code below to use the Dog class
  dog_hash = { name: name, age: age, breed: breed, image_url: image_url }

  dogs << dog_hash
  nil
end
  

# ✅ Add two conditions for walking and feeding (3 or 4)
def handle_choice
  user_input = ask_for_input

  if user_input == "1"
    list_dogs
  elsif user_input == "2"
    add_dog($dogs)
  else
    system('clear')
    puts "I didn't recognizer your command try again".red
  end
end
  


# ✅ Add a helper method `choose_dog_from_collection` that will:
#  - accept an array of dog instances as an argument
#  - print a numbered list (starting from 1) of each dog's name (breed) 
#    using .each_with_index
# https://ruby-doc.org/core-2.7.4/Enumerable.html#method-i-each_with_index
#  - ask the user to choose a number matching the dog they want to interact with
#  - return the dog instance corresponding to the choice they made
#  - ask the user to choose again if their choice didn't match a dog

def choose_dog_from_collection(dogs)
  dogs.each_with_index do |dog, index|
    # ✅ print out a number using each dog's index and its name (breed)
  end
  puts "Type the number associated with the dog you'd like to choose"
  # this code converts the number typed by the user and stored as a string
  # to an integer and then subtracts 1 to get the corresponding index in
  # the dogs array
  index = ask_for_input.to_i - 1
  # next we check if we got a valid choice and if not, we'll show an error 
  # and ask the user to choose again by invoking the method again.
  # we add index >= 0 to our condition because .to_i will return 0 if passed
  # a word that doesn't start with a number as an argument.
  # in that case, we'll end up with -1 and we'd prefer telling the user there
  # was a problem to doing dogs[-1] which actually returns the last dog in the array
  if index >= 0 && index < dogs.length
    dogs[index]
  else
    puts "Whoops! We couldn't find a dog matching your choice.".red
    puts "Please try again"
    choose_dog_from_collection(dogs)
  end
end

# ✅ Add a `walk_dog` method that will prompt the user to choose
# which dog to walk. After choosing a dog, invoke the `walk` method
# on the dog and then `print` it





# ✅ Add a `feed_dog` method that will prompt the user to choose
# which dog to feed. After choosing a dog, invoke the `feed` method
# on the dog and then `print` it
  