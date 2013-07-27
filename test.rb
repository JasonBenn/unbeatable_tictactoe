# Simple testing suite.

module Tester
	def self.test(*bools)
		bools.each_with_index do |result, i|
			unless result
				puts "Test ##{i+1} failed!"
				abort
			end
		end
	end
end

# If this file is run, runs all tests in the directory.

if $0 == __FILE__
	Dir.glob('./*.rb').each do |file|
		next if file == './test.rb'
		require file
	end
end
