collect:
	rm -f database.db
	asr run \"database.fromtree tree/A/*/*/ --children-patterns=\'\' \"	
