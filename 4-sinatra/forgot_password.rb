require 'securerandom'

puts "Podaj nowe hasło:"
pass1 = gets.chomp
puts "Potwierdz hasło:"
pass2 = gets.chomp

salt = SecureRandom.hex
timestamp = Time.now.strftime('%s')

hashed_password = Digest::SHA2.new(512).hexdigest(salt+"#"+pass1+"#"+timestamp)
password = "#{salt}:#{hashed_password}:#{timestamp}"

if pass1 == pass2
  File.open("password.txt", "w") { |file| file.write(password) }
  puts "Hasło zmienione."
else
  puts "Błąd! Podano różne hasła."
end
