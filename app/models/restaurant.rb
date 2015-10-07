class Restauraunt
	include	Mongoid::Document

	field :Borough, :type => String
	field :Cuisine, :type => String
	field :Score, :type => Integer	
	field :Grade, :type => String

end 