puts "Proper usage: \nphone.rb number" if ARGV.empty?
str = ARGV.first.to_s
num = []
arr = str.downcase.split("")
keyboard = { "0" => "0",
            "1" => "1",
            "abc2" => "2",
            "def3" => "3",
            "ghi4" => "4",
            "jkl5" => "5",
            "mno6" => "6",
            "pqrs7" => "7",
            "tuv8" => "8",
            "wxyz9" => "9"}
arr.each do |w|
  res = keyboard.keys.select { |s| s.include?(w) }
  unless res.empty?
    num << keyboard[res.first]
  else
    num << w
  end
end
puts num.join
