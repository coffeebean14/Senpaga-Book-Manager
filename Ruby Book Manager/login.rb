require 'json'

puts "Welcome to Senpaga Bookstore Manager"

file = File.read('Ruby Book Manager/file.json')
data_hash = JSON.parse(file)

datausername = data_hash["Username"]
datapassword = data_hash["Password"]
$user = data_hash["Full Name"]

# Username Input

print "Enter your username : "
username = gets.chomp

if username == datausername
    puts " "
else
    abort "Username Error."
end

# Password Input
print "Enter your password : "
password = gets.chomp

if password == datapassword
    puts "Login successful!"
else
    abort "Password error."
end



# Start looping add book
print "Add a book now? (Y/N) : "
$addmorebook = gets.chomp
if $addmorebook == "Y"
 begin
  # Add book
  puts "Please enter the title of your book : "
  $bookname = gets.chomp
  puts "Please enter the name of the book's author : "
  $bookauthor = gets.chomp
  
  # validate data before entering json
  print "Book Name     : " + $bookname
  print "nBook Author(s) : " + $bookauthor

  print "\nIs this book's information correct? (Y/N) "
  validatebook = gets.chomp

  # Book type details inside JSON file
  def booktype
      bookdata = {
      "Book Name" => $bookname,
      "Book Author" => $bookauthor,
      "User" => $user,

      }
      File.open("Ruby Book Manager/bookdata.json","w") do |f|
      f.write(JSON.pretty_generate(bookdata))
      end
  end

  if validatebook == "Y"
      puts booktype
      puts "Successfully stored book!"
  elsif validatebook == "N"
      abort "Please login again."
  else
      print "Y or N only"
  end
  puts " "
  puts "Add more books? : (Y/N)"
  $addmorebook = gets.chomp
 end while $addmorebook == "Y"

end

#
print "View Book ? (Y/N) : "
$viewmorebook = gets.chomp
if $viewmorebook == "Y"
 begin
    file = File.read('Ruby Book Manager/bookdata.json')
    data_hash = JSON.parse(file)
    
    # Detail Check
    booklet = data_hash["Book Name"]
    foundbooks = data_hash["Book Author"]

    puts "Title of the book : " + booklet
    puts "Author of the book : " + foundbooks
 end while $viewmorebook == "N"
end

print "Logout? (Y/N) : "
$logout = gets.chomp
if $logout == "Y"
 begin
  if $logout += "Y"
      abort "Goodbye."
  end
 end while $logout == "N"
end





