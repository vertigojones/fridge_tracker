require_relative '../config/environment'
require_relative '../app/models/fridge'

def run_tracker
  puts <<~HEREDOC
         Welcome to the fridge Tracker
         What Would you like to do?
         1. See all of your fridges
         2. Add a Fridge
         3. Delete a Fridge
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  
  if user_descision == 1
    p Fridge.all
  end

  if user_descision == 2
    puts "Fridge brand?:"
    brand_input = gets.chomp.to_s
    puts "Location?:"
    location_input = gets.chomp.to_s
    puts "Size (cubic feet)?:"
    size_input = gets.chomp.to_i
    puts "Has food (true or false)?:"
    food_input = gets.chomp
    puts "Has drinks (true or false)?:"
    drinks_input = gets.chomp

    Fridge.create(brand: brand_input, location: location_input, size: size_input, has_food_in_it: food_input, has_drinks_in_it: drinks_input)
    puts "Fridge added!"
  end

  if user_descision == 3
    p Fridge.all
    puts "Which fridge would you like to delete? Please enter the id number:"
    fridge_id = gets.chomp.to_i
    Fridge.find(fridge_id).destroy
    puts "Fridge has been removed!"
  end

end

def checkout_fridge(fridge_id)
  id = fridge_id
  
  # Find and Print a Fridge
  puts <<~HEREDOC
         What would you like to do with the fridge?
         1. Checkout the Food
         2. Checkout the Drinks
         3. Return to fridge Menu
         select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  # Your code
end

def run_food_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View All Food Items in a specific Firdge
         2. Add a food item to a fridge
         3. Eat a food item from a fridge
         4. Go Back to Fridge Menu
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  # Your Code Here
end

def run_drink_menu(fridge)
  fridge = fridge
  puts <<~HEREDOC
         1. View all drink items in a specific fridge
         2. Add a drink item to a fridge
         3. Consume PART of a drink from a fridge
         4. Consume ALL of a drink from a fridge
         5. Go Back to Fridge Menu
         Select a number:
       HEREDOC
  user_descision = gets.chomp.to_i
  # Your Code Here
end

run_tracker

