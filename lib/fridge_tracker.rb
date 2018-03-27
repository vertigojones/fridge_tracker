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
    pp Fridge.all
    puts "Which fridge do you want to see? Enter ID number:"
        fridge_id = gets.chomp.to_i
        puts checkout_fridge(fridge_id)
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
    pp Fridge.all
    puts "Which fridge would you like to delete? Please enter the id number:"
    fridge_id = gets.chomp.to_i
    Fridge.find(fridge_id).destroy
    puts "Fridge has been removed!"
    run_tracker
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
  
  if user_descision == 1
    pp Fridge.find(id).foods.all
    fridge = Fridge.find(id)
    puts run_food_menu(id)
  end

  if user_descision == 2
    pp Fridge.find(id).drinks.all
    fridge = Fridge.find(id)
    run_drink_menu(id)
  end

  if user_descision == 3
    run_tracker
  end

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
  
  if user_descision == 1
    pp Fridge.find(fridge).foods.all
  end

  if user_descision == 2
    puts "Food name?:"
    name_input = gets.chomp.to_s
    puts "food weight (in lbs)?:"
    weight_input = gets.chomp.to_i
    puts "Is it vegan (true or false)?:"
    vegan_input = gets.chomp

    Food.create(name: name_input, weight: weight_input, is_vegan_or_not: vegan_input, fridge_id: fridge)
  end

  if user_descision == 3
    pp Fridge.find(fridge).foods.all
    puts "Which food item did you eat? Enter id number:"
    food_input = gets.chomp.to_i
    
    Food.destroy(food_input)
    puts "Food has been removed" 
  end

  if user_descision == 4
    run_trracker
  end

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
  
  if user_descision == 1
    pp Fridge.find(fridge).drinks.all
  end

  if user_descision == 2
    puts "Drink name?:"
    name_input = gets.chomp.to_s
    puts "Drink size (in fl oz)?:"
    size_input = gets.chomp.to_i
    puts "Is it alcoholic (true or false)?:"
    alcohol_input = gets.chomp

    Drink.create(name: name_input, size: size_input, alcoholic: alcohol_input, fridge_id: fridge)
    puts "Drink added!"
  end

  if user_descision == 3
    pp Fridge.find(fridge).drinks.all
    puts "Which drink would you like? Enter id number:"
    drink_input = gets.chomp.to_i
    puts "How much fl oz is left?:"
    leftover_input = gets.chomp.to_i

    Drink.find(drink_input).update(size: leftover_input)
    puts "Drink updated!"
  end

  if user_descision == 4
    pp Fridge.find(fridge).drinks.all
    puts "Which drink did you finish? Enter id number:"
    drink_input = gets.chomp.to_i
    
    Drink.destroy(drink_input)
    puts "Drink has been removed"
  end

  if user_descision == 5
    run_tracker
  end

end

run_tracker

