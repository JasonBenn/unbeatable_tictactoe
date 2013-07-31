# Simple testing suite.

module Tester
	def self.test(*bools)
		bools.each_with_index do |result, i|
			unless result
				puts "Test ##{i+1} failed!"
				abort
			end
		end
		puts "passed #{$0}!"
	end
end
