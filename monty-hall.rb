DOORS = [:door1, :door2, :door3]
TESTS = 10000

stick_wins = 0
switch_wins = 0

# Stick
(1..TESTS).each do |test_num|
  doors = DOORS.dup
  # Randomise the prize door from all doors
  prize_door = doors.shuffle.first
  # Randomise the chosen door from all doors
  chosen_door = doors.shuffle.first
  # Make a list of empty doors
  doors.delete(prize_door)
  empty_doors = doors.dup
  # Monty picks a random door from the list of empty doors
  monty_door = empty_doors.shuffle.first
  # Nothing further is done; we're sticking with our first
  # choice of door
  if (prize_door == chosen_door)
    stick_wins += 1
  end
end

# Switch
(1..TESTS).each do |test_num|
  doors = DOORS.dup
  # Randomise the prize door from all doors
  prize_door = doors.shuffle.first
  # Randomise the chosen door from all doors
  chosen_door = doors.shuffle.first
  
  # Make a list of empty doors
  doors.delete(prize_door)
  doors.delete(chosen_door)
  doors_available_for_monty = doors.dup

  # Monty picks a random door from the list of empty doors
  monty_door = doors_available_for_monty.shuffle.first

  # empty_doors is now a one-item array containing the door
  # that has not been either chosen or opened by Monty.
  # Figure out which door we get if we switch doors
  doors = DOORS.dup
  doors.delete(monty_door)
  doors.delete(chosen_door)

  new_chosen_door = doors.first
  if (prize_door == new_chosen_door)
    switch_wins += 1
  end
end

# Work out the results
# With 1,000 tests, this is almost always 33% wins for
# sticking, and 66% wins for switching as proved mathematically in https://en.wikipedia.org/wiki/Monty_Hall_problem
puts "Sticking won " + ((stick_wins.to_f / TESTS.to_f) * 100).to_i.to_s + "%"
puts "Switching won " + ((switch_wins.to_f / TESTS.to_f) * 100).to_i.to_s + "%"
