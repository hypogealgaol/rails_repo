namespace: import_csv do
	desc "imports the cvs and then does something with it"
	task :check_rating do
		puts "starting to read in the csv"
		require 'csv'
		CSV.foreach('example.csv', :headers => true) do |row|
			#create model not using scaffold to represent items in csv
			#remove whitespace before and after strings
			#create automatically saves
			restauraunt = Restauraunt.create({
				
				:

			})

		end


	end

	task :remove_whitespace, [:string] do |t, args| #rake helper methods, then require that file inside the rake
		#://stackoverflow.com/questions/15163750/where-to-put-helper-functions-for-rake-tasks-and-test-files-in-ruby-on-rails


	end





end