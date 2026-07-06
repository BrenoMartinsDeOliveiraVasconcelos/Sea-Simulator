frames += 1

if (not has_algae and frames >= wait_spawn){
	frames = 0
	has_algae = true
	algae = instance_create_layer(x, y, "Living", oAlgae)
	algae.encubator_object = self
	algae.image_index = irandom_range(0, algae.image_number-1)
	algae.is_origin = true
	algae.origin = algae
	algae.inst_parent = algae
	son_algae = algae
}