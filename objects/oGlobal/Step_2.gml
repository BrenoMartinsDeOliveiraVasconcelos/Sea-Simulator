global.algae = instance_number(oAlgae)
global.fish_number = instance_number(oFish)

if (global.fish_number <= 0){
	global.is_start = true
}

global.total_oxigen = max(global.total_oxigen, 0)

if (global.total_oxigen <= 0 and !global.is_start){
	//Kill fish
	instance_victim = irandom_range(0, array_length(global.fish_list)-1)
	victm = global.fish_list[instance_victim]
	
	instance_destroy(victm)
	
	array_delete(global.fish_list, instance_victim, 1)
}