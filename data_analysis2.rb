# tell the user what the program is doing.

puts "\nThis program will perform a statistical analysis of the average prime-interest-rate reported weekly over the period 8/10/55 - 9/10/14.\n\n"

# to get the data file (primerate.csv) into the program, you need to open the data file as a NEW FILE (File.new) in read mode and call it variable f

f = File.new("primerate.csv","r")

# you need to read each line in the file f (f.readlines) and call the read lines the variable primerates.  This will create a large array of values from your data file and this array is name "primerates."

primerates = f.readlines

# now you have all the data from the data file into an array called primerates.  Close the file f that you initially opened (f.close)as you are done with it 

f.close

# if you want to check if your data array was created correctly PUTS the array to the screen using .INSPECT

# puts primerates.inspect

# to add up all the data in your array, first set a variable for this total called "sum" and set it equal to 0 to start

sum = 0

# now on your primerates array, you want to DO something to EACH (.each do) element in that array (what is inside the ||).  You can call each individual element in your array "primerate."

primerates.each do |primerate|

# add the next value (primerate) from your array to the ongoing sum. Finally, we want to convert this sum to a float (.to_f) as it is a string initially and round off oour sum to 2 decimal places (.round(2)).
  sum = (sum + primerate.to_f).round(2)

# when the DO block is done, you must END it.
end

# if you want to see the sum, PUTS it to the user.
puts "The sum of all the data points is: #{sum}.\n\n"

# to find out how many data points you have in your array, run the .LENGTH method on your primerates array.
puts "The number of data points is: " + primerates.length.to_s + "\n\n"

# to find the mean, take the total sum of all the data points and divide by the number of data points in the array.
mean = (sum/primerates.length).round(2)

# to print out the mean, use a puts statement with a string
puts "The mean primerate is #{mean}%.\n\n"

# to calculate the standard deviation, you first need to find the variance from the mean for each element in the primerates array.  Accomplish this with a .EACH DO on each number in array |primerate|. You also need to add these all together so you can find the average variance.  Start off by setting variance_sum to 0.
variance_sum = 0 
primerates.each do |primerate|
 variance_sum = variance_sum + (primerate.to_f - mean)**2
end

# to find the standard deviation, it is the square root of the average variance.
stand_dev = ((variance_sum/primerates.length)**0.5).round(2)

puts "The standard deviation in the data is #{stand_dev}%.\n\n"

# to find the z-score, it is the (data point - mean)/std.dev. This needs to be done for each data point in the array primerates so we can accomplish this with an .EACH DO statement on each element |primerate| in the array.  This then needs to be stored in a new file called 

g = File.new("z_scores.csv","w")
primerates.each do |primerate|
  z_score = ((primerate.to_f - mean)/stand_dev).round(2)
  g.puts primerate.to_s.chomp + ", " + z_score.to_s  
end 
g.close

puts "A data file of z-scores for this data set entitled z_scores.csv has now been created in your directory.\n\n"

# now find the median of the data set.  To do this first sort the array (primerate.sort) into ascending order.

primerates.sort

# as there may be an even amount of data points, we need an if else statement to handle the two possibilities of calculating median.  To check if there are an even number of data points, divide the length of the primerates array (primerates.length) using "%" to just look at the remainder.  If the remainder doesn't equal zero (!=)then there are an odd number of data points and the median is the middle term.  If the remainder does equal 0 then the median is the average of the two middle terms.

if primerates.length.to_f%2 != 0
  half_data = primerates.length.to_i/2
  mid_num = half_data + 1
  median = primerates[mid_num]
  puts "The median of the data set is #{median}%.\n\n"
else
  half_data = primerates.length.to_i/2
  half_data2 = half_data + 1
  median = (primerates[half_data].to_f + primerates[half_data2].to_f)/2
  puts "The median of the data set is #{median}%.\n\n"
end   


