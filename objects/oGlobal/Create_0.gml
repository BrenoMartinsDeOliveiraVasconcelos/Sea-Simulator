randomise()

window_res = [1366, 768]
window_set_size(window_res[0], window_res[1])

// Background mounting
LUMNA_W = room_width
LUMNA_H =  12

NUMBER_INSTS_H = room_height/LUMNA_H
BASE_ALPHA = 0.1
ALPHA_DECREASE_FACTOR = BASE_ALPHA / NUMBER_INSTS_H

var x_place = 0
var y_place = 0
var current_alpha = BASE_ALPHA

for (var h=0; h<NUMBER_INSTS_H;h+=1){
	var inst = instance_create_layer(x_place, y_place, "Effects", oLumna)
	inst.image_alpha = current_alpha
	
	inst.image_xscale = LUMNA_W // Size = 1, so scale = width
	inst.image_yscale = LUMNA_H // same as last row.
	
	y_place += LUMNA_H
	current_alpha -= ALPHA_DECREASE_FACTOR
}


// Place floor

floor_levels = 30

starting_y = room_height - floor_levels
rock_spawn_chance = 50
rock_invert_chance = 500

for (var level= 0; level<floor_levels; level+=1){
	for (var xcol=0; xcol<=room_width; xcol+=1){
		var ycol = starting_y+level
		if (level == 0){// SPawn rock if level 0
			if (chance_gen(rock_spawn_chance)){
				var inst_rock = instance_create_layer(xcol, ycol, "Instances", oRock)
				inst_rock.image_index = irandom_range(0,  inst_rock.image_number-1)
				inst_rock.image_yscale = 2
				inst_rock.image_xscale = 2
				
				if (chance_gen(rock_invert_chance)){
					inst_rock.image_xscale  *= -1
				}
			}
		} 
		
		var inst = instance_create_layer(xcol, ycol, "Instances", oFloor)
		inst.image_index = irandom_range(0,  inst.image_number-1)
	}
}

fish_start_population = 50

fish_spawn_timer = 60
current_fish_frame = 0
global.is_start = true
global.total_oxigen = 0
global.base_bubble_freq = 1000
global.floor_level = starting_y
global.algae = 0
global.fish_number = 0
global.gamefont = font_add_sprite_ext(fGamefont, "0123456789-+/. AOF", true, 1)
global.adult_fish_scale = 1.5 // Determines age and base scale for adult fish
global.fish_list = []