push_speed=10
jump_height=3
height=1

//global.is_grounded=!physics_test_overlap(x,y-10,0,all) 
pushing_left=keyboard_check(ord("A"))
pushing_right=keyboard_check(ord("D"))
direction_pushing=-pushing_left
if (pushing_right)direction_pushing=1

current_direction=-pushing_left
if (pushing_right) current_direction=1
if (global.is_grounded) global.jump_number=0

//if health<100 push_speed*=5
trying_jump=keyboard_check_pressed(ord("W"))
if trying_jump show_debug_message(string(global.jump_number))
    is_jumping=0
    if(global.jump_number<2 and trying_jump){
        is_jumping=1
        if global.jump_number=1{
            //phy_linear_velocity_x=0
            phy_linear_velocity_y=0
            }
        height_mod=1
        physics_apply_impulse(x,y,0,-jump_height*100/height_mod);
        global.jump_number+=1
        effect_create_below(ef_smoke,x,y,5,c_gray)
        }
    if (direction_pushing!=0 and (global.is_grounded  or is_jumping)){ 
        physics_apply_force(x,y,direction_pushing*push_speed*100,0);
    }
    
if (current_direction!=0 and keyboard_check(vk_space) and health>99){
physics_apply_impulse(x,y,current_direction*1000,0);
health=0;
}
global.is_grounded=0
show_debug_message(place_empty(mouse_x,mouse_y))
