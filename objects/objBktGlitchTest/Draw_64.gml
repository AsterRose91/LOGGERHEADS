///@description DRAW GLITCHING
if (!do_glitch) {exit;}

// Activating the shader
bktglitch_activate();

// Quickly setting all parameters at once using a preset
//bktglitch_config_preset(BktGlitchPreset.B);


// config
bktglitch_config(0.001044, 0.277081, 1.102966, 0.838080, 0.233782, 0.393795, 16.862982, 0.677790, 0.048376, 0.187399, 0.042199, 0.131335, 8.209948, 1.000000, 0.755984);

// Additional tweaking
bktglitch_set_jumbleness(0.5);
bktglitch_set_jumble_speed(2.5);
bktglitch_set_jumble_resolution(random_range(0.2, 0.4));
bktglitch_set_jumble_shift(random_range(0.2, 0.4));
bktglitch_set_channel_shift(0.01);
bktglitch_set_channel_dispersion(.05);

// Setting the overall intensity of the effect, adding a bit when the ball bounces.
//bktglitch_set_intensity(0.025); //+ bounceIntensity);

// Drawing the application surface
draw_surface(application_surface, 0, 0);

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();