current_frame += 1
current_bubble_frame += 1
current_oxigenation_frame += 1

growt_rate = base_growt_rate + (size*10)

if (current_oxigenation_frame >= passive_oxigen_rate){
	current_oxigenation_frame = 0
	global.total_oxigen += passive_oxigen_emission
}

if (chance_gen(ramification_chance)){
	has_grown = false
	ramification_chance -= 100
}


if (current_frame >= growt_rate and not has_grown and y < room_height){
	current_frame = 0
	has_grown = true
	grow_xy = [x-(irandom_range((sprite_width*-1)+1, sprite_width-1)), y-(sprite_height)]
	
	grow_xy[0] = max(min(room_width, grow_xy[0]), 0)
	grow_xy[1] = max(min(room_height, grow_xy[1]), 0)
	
	algae = instance_create_layer(grow_xy[0], grow_xy[1], "Living", oAlgae)
	algae.encubator_object = self.encubator_object
	algae.image_index = irandom_range(0, algae.image_number-1)
	algae.image_xscale = image_xscale
	algae.image_yscale = image_yscale
	algae.origin = origin
	algae.inst_parent = self
	algae.frames_per_bubble = algae.frames_per_bubble+(irandom_range(-500, 500))
	algae.is_top = true
	algae.size = size + 1
	frames_per_bubble *= 1.5
	is_top = false
	
	if (is_top){
		global.total_oxigen += 1
	}
	
}


if (current_bubble_frame >= frames_per_bubble){
	current_bubble_frame = 0
	bubble_x = irandom_range(x-50, x+50)
	
	bubble_x = max(min(room_width, bubble_x), 0)
	
	bubble = instance_create_layer(x, y, "Effects", oBuble)
	bubble.duration = irandom_range(life_range_min, life_range_max)
	bubble.image_index = irandom_range(0, bubble.image_number-1)
}


if (!instance_exists(inst_parent)){
	nutrient = instance_create_layer(x, y, "Hidden", oNutrient)
	nutrient.image_index = 1
	instance_destroy(self)
}