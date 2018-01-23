require 'securerandom'

puts "Podaj nowe hasło:"
pass1 = gets.chomp
puts "Potwierdz hasło:"
pass2 = gets.chomp

unless pass1 == pass2
  puts "Błąd! Podano różne hasła."
else
  salt = SecureRandom.hex
  timestamp = Time.now.strftime('%s')

  hashed_password = Digest::SHA2.new(512).hexdigest(salt+"#"+pass1+"#"+timestamp)
  password = "#{salt}:#{hashed_password}:#{timestamp}"

  File.open("password.txt", "w") { |file| file.write(password) }
  puts "Hasło zmienione."
end

