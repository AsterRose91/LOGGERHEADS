///@description CAMERA CONTROLS
if (!CAM_PAN_ENABLED) {exit;}

if (input_check("CAMERA_RESET")) {
	CAM_X = 0;
	CAM_Y = 0;
}


var DY = input_value("CAMERA_DOWN") - input_value("CAMERA_UP"),
	DX = input_value("CAMERA_RIGHT") - input_value("CAMERA_LEFT"),
	_SPEED = clamp(point_distance(0, 0, DX, DY), 0, 1),
	_DIR = point_direction(0, 0, DX, DY),
	
	FINAL_XX = lengthdir_x(3 * _SPEED, _DIR),
	FINAL_YY = lengthdir_y(3 * _SPEED, _DIR);
	
CAM_XV = approach(CAM_XV, FINAL_XX , 0.5);
CAM_YV = approach(CAM_YV, FINAL_YY , 0.5);

repeat(floor(abs(CAM_YV))) {
	CAM_Y += sign(CAM_YV);
}

repeat(floor(abs(CAM_XV))) {
	CAM_X += sign(CAM_XV);
}

camera_set_view_pos(view_camera[0], CAM_X, CAM_Y);


