hunger_frame += 1
hunger_decay_frame += 1
eat_frame += 1
oxigen_frame += 1

if (mode == FishMode.SWIMMING) {
    dir_change_timer--;
    if (dir_change_timer <= 0) {
        dir += random_range(-30, 30);
		
        // Keep direction within 0–360
        dir = dir mod 360;
        dir_change_timer = irandom_range(30, 90);
    }
	
	border = 16
	if (x < border){
		dir = 0
	}
	
	if (x > room_width - border){
		dir = 180
	}
	
	if (y < border){
		dir = 270
	}
	
	if (y > global.floor_level-border){
		dir = 90
	}
	
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
	
	image_angle = dir

}

if (mode == FishMode.EATING) {
    if (target != noone && !instance_exists(target)) {
        target = noone
    }

    if (target == noone) {
        if (global.algae > 0) {
            var nearest = noone
            var min_dist = infinity
            
            with (oAlgae) {
                if (is_top == true) {
                    // other is fish
                    var dist = point_distance(x, y, other.x, other.y);
                    if (dist < min_dist) {
                        min_dist = dist
                        nearest = id
                    }
                }
            }

            if (nearest != noone) {
                target = nearest
            } else {
                global.algae = 0
                mode = FishMode.SWIMMING
                exit;
            }
        } else {
            mode = FishMode.SWIMMING
            exit;
        }
    }

    if (instance_exists(target) && target.is_top == true) {
        angle = point_direction(x, y, target.x, target.y)
        image_angle = angle
        
        x += lengthdir_x(spd, angle)
        y += lengthdir_y(spd, angle)
    } else {
        target = noone
    }

    if (hp >= 100 and hunger >= 100) {
        mode = FishMode.SWIMMING
    }

    if (eat_frame >= eat_timeout) {
        is_timeouted = false
        eat_frame = 0
    } else {
        is_timeouted = true
    }
}

if (hunger_threeshold >= hunger and hunger_frame >= hunger_damage_rate){
	hp -= (base_damage_hunger+(1-hunger/max_hunger)*10)
	hunger_frame = 0
}

if (hunger_decay_frame >= hunger_decay_rate){
	hunger -= 1
	hunger_decay_frame = 0
}

if (hp <= 0){
	instance_destroy(self)
}

if (hunger <= seek_food_hunger){
	mode = FishMode.EATING
}

if (oxigen_frame >= oxigen_draw_timeout){
	oxigen_frame = 0
	global.total_oxigen -= oxigen_draw_rate
}

hunger =max(0, min(hunger, max_hunger))
hp = max(0, min(hp, max_hp))

if (age < 1-age_zero_alpha){
	image_alpha = age+age_zero_alpha
}else{
	image_alpha = 1
}

if (age < global.adult_fish_scale-age_zero_scale){
	if (has_grown){
		has_grown = false
		image_xscale = age+age_zero_scale
		image_yscale = age+age_zero_scale
		
		// spend more as grow
		oxigen_draw_rate *= grow_increase_spendure
		hunger_decay_rate *=  (1-(grow_increase_spendure-1))
	}
}else{
	image_xscale = global.adult_fish_scale+age_zero_scale
	image_yscale = global.adult_fish_scale+age_zero_scale
}

if (age >= age_limit){
	instance_destroy(self) // die
}