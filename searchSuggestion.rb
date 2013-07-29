

#
# input_array: [input word, dictionary word 1, dictionary word 2]
#
def search_suggestion(input_array)
	word = input_array[0]
	dict1 = input_array[1]
	dict2 = input_array[2]
	
	dict1_score = compare_word_to_dictionary(word, dict1)
	dict2_score = compare_word_to_dictionary(word, dict2)

	if dict1_score > dict2_score
		puts dict1
	else
		puts dict2
	end

end

def compare_word_to_dictionary(word, dict) 
	word_letters = word.split('')
	dict1 = dict.split('')
	last_index = 0
	subsequence = []

	word_letters.each do |letter|
		dict1.each_with_index do |dict_letter, index|
			if dict_letter == letter
				subsequence << letter
				last_index = index + 1
				dict1 = dict1[last_index..-1]
				break
			end
		end
	end

	return subsequence.length
end

# read input file

myfile = File.foreach("SAMPLE_INPUT.txt").map { |line| line.split(' ') }
test_count = myfile[0].first.to_i
puts myfile[2]
index = 1
full_input_array = []
while index/4 < test_count
	temp_array = []
	temp_array << myfile[index+1].first
	temp_array << myfile[index+2].first
	temp_array << myfile[index+3].first
	full_input_array << temp_array
	index = index + 4
end

# loop through full_input_array and call search_suggestion
full_input_array.each_with_index do |test_case, index|
	puts "test #{index}: #{test_case[0]}"
	search_suggestion(test_case)
end
