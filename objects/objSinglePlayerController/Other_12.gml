/// @description LEVEL RESTART
play_sfx(choose(sfxReset0, sfxReset1, sfxReset2, sfxReset3));

part_particles_clear(PARTICLE_MAN);

GAME_PAUSED = false; // TOGGLE PAUSE
WAIT_TIMER = 0;
MOVES_COUNTER = 0;
CHOPS_COUNTER = 0;
RETRIES_COUNTER++;	// NUMBER OF TIMES YOU'VE RETRIED A LEVEL
LEVEL_WON = false;

// RESTORE LEVEL STATE
RestoreLevelState(LEVEL_RESTART_DATA);
