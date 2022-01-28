def with_debugging
    puts "Got Here!"
    result = yield
    puts "Result was #{result}"
end

def with_debugging
    puts "Got Here!"
    result = yield
    puts "Result was #{result}"
end

def with_expectation(expected_value)
    puts "Running test..."
    result = yield
    if result == expected_value
      puts "Passed."
    else
      puts "Failed!"
      puts "Expected #{expected_value}, but got #{result}."
    end
  end

with_debugging do
    magic_number = (23 - Time.now.hour) * Math::PI
  end

  with_expectation(4) {2+2}
  with_expectation(5) {2+2}