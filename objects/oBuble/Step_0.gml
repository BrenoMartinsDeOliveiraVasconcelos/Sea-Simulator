frames_since_spawn += 1

y -= accending_steps

if (frames_since_spawn == duration or y < 0){
	instance_destroy(self)
}