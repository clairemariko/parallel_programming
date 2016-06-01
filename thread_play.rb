def expensive_operation(number)
  (0..100).each do |iteration|
    number = Math.sqrt(number) + 5
  end
  number
end

array_size = 999999
# test_array = (1..array_size).to_a


start_time = Time.now

# mutex = Mutex.new
sum_1= 0
sum_2=0

t1 = Thread.new do 
  (1..array_size/2).each do |number|
    sum_1 += expensive_operation(number)
  end
end

t2 = Thread.new do 
  ((array_size/2+1)..array_size).each do |number|
    sum_2 += expensive_operation(number)
  end
end

t1.join
t2.join
# test_array.each do |number|
#   sum += expensive_operation(number)
# end
sum = sum_1 + sum_2

end_time = Time.now


puts("The sum is #{sum}")
puts("It took #{ end_time - start_time } seconds")