
require 'timeout'

def try_with_timeout(timeout_duration)
    begin
      Timeout.timeout(timeout_duration) do
        yield
      end
    rescue Timeout::Error
      # handle it however you like!
      puts "Took too long!"
    end
  end

  try_with_timeout(2.0) do
    sleep 3.0
    puts "Yawn..."
  end