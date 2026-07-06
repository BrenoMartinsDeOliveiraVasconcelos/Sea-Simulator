// Modes
enum FishMode {
    SWIMMING,
    MATING,
    EATING
}

mode = FishMode.SWIMMING;

spd = 1;                // movement speed
dir = random(360);      // current direction in degrees
dir_change_timer = 0;   // countdown until next direction change
hunger = 100
hunger_threeshold = 30
seek_food_hunger = 40
hunger_damage_rate = 60
hunger_frame = 0
hunger_decay_frame = 0
base_damage_hunger = 1
hp = 100
max_hp = 100
max_hunger = 100

oxigen_draw_timeout = 30
oxigen_frame = 0
eat_timeout = 30
eat_frame = 0
is_timeouted = false
has_grown = true
age = 0
age_zero_alpha = 0.3

target = noone

// Base values for vary
base_oxygen_draw = 1000
base_hunger_decay = 60
base_age_zero_scale = 0.5
base_age_limit = 3

base_mod_p = 0.75 // base modifier sub
base_mod_m = 1.25 // base modifier up
grow_increase_spendure = 1

// variating variables
oxigen_draw_rate = random_range(base_hunger_decay*base_mod_m, base_hunger_decay*base_mod_p) // Determines oxygen drawing rate in units
hunger_decay_rate =  random_range(base_hunger_decay*base_mod_m, base_hunger_decay*base_mod_p) //Determines hunger decaying rate in frames
age_zero_scale =  random_range(base_age_zero_scale*base_mod_m, base_age_zero_scale*base_mod_p) // Determines the borning size and therefore the adult size
age_limit =  random_range(base_age_limit*base_mod_m, base_age_limit*base_mod_p) // Determine the age where fish gonna die
gender = irandom_range(0, 1) // Determine gender of fish

