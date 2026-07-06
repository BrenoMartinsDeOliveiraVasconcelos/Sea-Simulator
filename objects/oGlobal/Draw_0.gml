font = global.gamefont
draw_set_font(font)

draw_text_transformed(10, 10, "A "+string(global.algae)+" O "+string(global.total_oxigen)+"F "+string(global.fish_number), 1.0, 1.0, 0);
draw_text_transformed(10, 30, $"{fps}", 1.0, 1.0, 0)
