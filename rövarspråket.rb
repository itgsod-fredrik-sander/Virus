
/Translates the string taken in as a parameter to rövarspråket and returns it as a string value/
def to_rovarsproket(string)
	/Declare and initialize a string that will hold the translated string/
	temp = ""

	/Declares and initialize the counter variable/
	i = 0

	/Iterate over the string's characters/
	while i < string.size
		/Check if the character does not contain a, e, i, o, u, y, å, ä, ö or a white space/
		if string[i] !~ /[aeiouyåäö]/ && string[i] !~ / /
			/Add the character with a 'o' and the character to the temp string/
			temp << string[i] + 'o' + string[i]
		else
			/Add the character to the temp string/
			temp << string[i]
		end
		/Increment the counter by one/
		i += 1
	end

	/Return the translated string/
	return temp
end

def from_rovarsproket(string)
	temp = ""
	i = 0

	while i < string.size
		if i+2 < string.size
			if string[i]+string[i+1]+string[i+2] == string[i]+'o'+string[i]
				string[i+1] = ''
				temp << string[i]
			elsif string[i] =~ /[aeiouyåäö]/ && string[i] =~ / /
				temp << string[i]
			end
		end
		i += 1
	end

	if string[string.size - 1] =~ /[aeiouy]/ && string[string.size - 1] =~ / /
		temp << string[string.size - 1]
	end

	return temp
end
