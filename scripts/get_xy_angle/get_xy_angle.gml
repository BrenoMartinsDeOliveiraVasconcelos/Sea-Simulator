function get_xy_angle(origin_x, origin_y, distance, angle){
	x_pos = origin_x + distance * cos(degtorad(angle))
	y_pos = origin_y + distance * sin(degtorad(angle))
	
	return [x_pos, y_pos]
}