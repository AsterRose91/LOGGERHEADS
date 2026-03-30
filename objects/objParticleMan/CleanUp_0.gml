/// @description CLEANUP TIME?
part_system_clear(PARTICLE_MAN)
if (part_type_exists(JUICE)) {part_type_destroy(JUICE);}
if (part_type_exists(GLITTER)) {part_type_destroy(GLITTER);}
if (part_type_exists(SPLINTERS)) {part_type_destroy(SPLINTERS);}
if (part_type_exists(KABOOM_PART)) {part_type_destroy(KABOOM_PART);}
if (part_type_exists(FUSE_SPARKS)) {part_type_destroy(FUSE_SPARKS);}
if (part_system_exists(PARTICLE_MAN)) {part_system_destroy(PARTICLE_MAN);}