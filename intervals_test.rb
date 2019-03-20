def interval_find_overlap(arr) #arr => [ {0=>1}, {2=>4}, {6=>7}, {3=>5} ]
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
  }

  if flag
    interval_find_overlap(result)
  else
    return result
  end
end

#usage notes
#interval_find_overlap([ {0=>1}, {2=>4}, {6=>7}, {3=>5} ])


