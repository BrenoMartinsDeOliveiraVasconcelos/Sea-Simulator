if (other.mode == other.FishMode.EATING and not other.is_timeouted){
	if (instance_exists(other.target)){
		if (other.target.id == id){
			other.hunger *= 1.25
			other.hp *= 1.25
			other.target = noone
			other.age += 0.01
			other.has_grown = true
		
			self.inst_parent.has_grown = false
			self.inst_parent.is_top = true
	
			instance_destroy(self)
		}
	}
}