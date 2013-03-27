p "Hello, world"

p "Hello, Ruby".index "Ruby"

10.times{|i| puts "matt"}

(1..10).each{|i| puts "This is sentence number #{i}"}

puts "#################################################"

secret = rand(10)
loop do 
  puts "Guess a number 0-9: "
  
  begin
    guess = Integer(gets.chomp)
  rescue
    puts "That's not a number..."
    next
  end

  break if guess == secret

  puts "Too #{guess > secret ? 'high' : 'low'}."
end

puts "You got it, the magic number was: #{secret}"