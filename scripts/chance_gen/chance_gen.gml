function chance_gen(chance_rate){
	number = irandom_range(1, 1000)
	
	return number <= chance_rate
}