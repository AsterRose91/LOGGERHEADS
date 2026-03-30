/// @description CHECK IF PLAYER CAN MAKE VALID MOVES
if (!AnyValidLogs(CURRENT_TURN)) {event_perform(ev_other, ev_user0);}