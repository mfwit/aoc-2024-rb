safeCount = 0
input = File.open('input').read.split("\n")
input.each do |report|
  incSafe = true
  decrSafe = true
  safe = false
  levels = report.split(" ")
  levels.each_index do |l|
    if l > 0
      diff = (levels[l].to_i - levels[l-1].to_i).abs
      if levels[l].to_i <= levels[l-1].to_i || diff > 3
        incSafe = false
      end
      if levels[l].to_i >= levels[l-1].to_i || diff > 3
        decrSafe = false
      end
    end
  end
  if incSafe || decrSafe
    safe = true
    safeCount += 1
  end
  puts "#{levels}: safe? #{safe}"
end
puts safeCount
