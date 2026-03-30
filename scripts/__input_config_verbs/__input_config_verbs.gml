// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
            UP:    [input_binding_key(vk_up),    ],
            DOWN:  [input_binding_key(vk_down),  ],
            LEFT:  [input_binding_key(vk_left),  ],
            RIGHT: [input_binding_key(vk_right), ],
            
			CHOP:		[input_binding_key("Z")],
			TURN:		[input_binding_key("X")],
			UNDO:		[input_binding_key("C")],
			JOURNAL:	[input_binding_key("J")],
			
            PAUSE: input_binding_key("P"),
			RESET: input_binding_key("R"),
			DEBUG: input_binding_key(vk_f3),
        },
        
        gamepad:
        {
            UP:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            DOWN:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            LEFT:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            RIGHT: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
            
			CHOP:	input_binding_gamepad_button(gp_face1),
			TURN:	input_binding_gamepad_button(gp_face2),
			UNDO:	input_binding_gamepad_button(gp_face3),
			JOURNAL: input_binding_gamepad_button(gp_select), 
			
            PAUSE: input_binding_gamepad_button(gp_start),
			RESET: input_binding_gamepad_button(gp_face4),
			DEBUG: input_binding_gamepad_button(gp_guide),
			
        },
        
        touch:
        {
            UP:    input_binding_virtual_button(),
            DOWN:  input_binding_virtual_button(),
            LEFT:  input_binding_virtual_button(),
            RIGHT: input_binding_virtual_button(),
			
			CHOP:  input_binding_virtual_button(),
            TURN: input_binding_virtual_button(),
			UNDO: input_binding_virtual_button(),
			JOURNAL: input_binding_virtual_button(),
            
            PAUSE: input_binding_virtual_button(),
			RESET: input_binding_virtual_button(),
			DEBUG: input_binding_virtual_button(),
        }
    };
}