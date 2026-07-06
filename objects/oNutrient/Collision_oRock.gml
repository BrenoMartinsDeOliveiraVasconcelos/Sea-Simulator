if (other.son_algae != noone and !instance_exists(other.son_algae)){
	other.wait_spawn = 120
	other.frames = 0
	other.has_algae = false
	
	instance_destroy(self)
}