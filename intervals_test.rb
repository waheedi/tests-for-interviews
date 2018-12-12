#Merging overlapping intervals
#You need to write a function that reads a list of intervals from STDIN , 
#merges the intervals that are overlapping and write the resulting list to STDOUT
#If your function reads a list of intervals that contain (2,4) and (3,5), 
#because those two intervals have an overlap they should be merged into a single
#interval (2,5)
#Sample Input
#[0,1][2,4][6,7][3,5]
#Sample Output
#[0,1][2,5][6,7]

def interval_find(arr) #arr => [ {0=>1}, {2=>4}, {6=>7}, {3=>5} ]
  result = []
  arr = arr.sort_by{|hsh| hsh.keys[0]}
  delete = []
  flag = false
	arr.each_with_index { |a,i|
		 if i+1 < arr.length && a.values[0] >= arr[i+1].keys[0] 
		 	 result << {a.keys[0] => arr[i+1].values[0]}
		 	 delete << i+1
		 	 flag = true 
		 else
		   result << {a.keys[0] => a.values[0]}
		 end
	}
  
	delete.each { |i|
		result.delete_at(i)
		arr.delete_at(i)
	}

	if flag
		interval_find(result)
	else
		return result
	end
  
end

