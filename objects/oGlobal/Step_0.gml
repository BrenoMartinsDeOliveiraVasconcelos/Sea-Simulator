current_fish_frame += 1

if (global.is_start and global.algae >= fish_start_population+50 and current_fish_frame >= fish_spawn_timer and global.total_oxigen >= 1000){
	current_fish_frame = 0
		var fishy = instance_create_layer(0, irandom_range(0, starting_y), "Living", oFish)
		fishy.image_xscale = 1.5
		fishy.image_yscale = 1.5
		fishy.image_index = irandom_range(0, fishy.image_number)
		global.fish_number += 1
	if (global.fish_number >= fish_start_population){
		global.is_start = false
	}
}

