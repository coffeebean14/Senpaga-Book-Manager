require 'io/console'
require 'json'

# Get username
print "Enter your name : "
name = gets.chomp

# Welcome user
puts "Hi " + name + "\nHow are you?"
situation = gets.chomp

# Stores information into JSON file
puts "\nPlease enter credentials below : "

print "Your username : "
$fullname = gets.chomp

print "Your password : "
$username = gets.chomp

print "Press enter."
$password = STDIN.noecho(&:gets).chomp

# Prints user data
puts "\nThese are your credentials : "
puts "Fullname : " + $fullname
puts "Password : " + $username

print "\nIs this information correct? (Y/N) : "
info = gets.chomp

# Create JSON file
def funcjson
    userdata = {
    "Full name" => $fullname,
    "Username" => $username,
    "Password" => $password
    }
    File.open("Ruby Book Manager\file.json", "w") do |f|
    f.write(JSON.pretty_generate(userdata))
    end
end

# Checking process
if info == "Y"
    puts funcjson
    print "Your information was successfully stored\n"

elsif info == "N"
   print "Please restart the programn"

else
    print "Please enter Y for yes, and N  to do it again.\n"
end

