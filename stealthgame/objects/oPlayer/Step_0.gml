key_Left = keyboard_check_direct(ord("A"));
key_Right = keyboard_check_direct(ord("D"));
key_Up = keyboard_check_direct(ord("W"));
key_Down = keyboard_check_direct(ord("S"));
key_Sprint = keyboard_check_direct(vk_lshift);

key_hor = Key_Right - Key_Left;
key_vert = Key_Down - Key_Up;
key_speed = min(1,abs(key_hor)+abs(key_vert));
key_dir = point_direction(0,0,key_hor,key_vert);



//Collisions and Movement
//Horizontal (X)
if place_meeting(x+(sign(key_hor)*8),y,oWall){
 
    while !place_meeting(x+(sign(key_hor)*4),y,oWall){
        x += key_hor;
    }
 
    if place_meeting(x+(sign(key_hor)*8),y+16,oWall){
        y = y - 4;
    }
 
    if place_meeting(x+(sign(key_hor)*8),y-16,oWall){
        y = y + 4;
    }
 
}
else
{
    x += lengthdir_x(key_speed*playerSpeed,key_dir);
}
 
//Vertical (Y)
if place_meeting(x,y+(sign(key_vert)*8),oWall){
 
    while !place_meeting(x,y+(sign(key_vert)*4),oWall){
        y += key_vert;
    }
 
    if place_meeting(x+16,y+(sign(key_vert)*8),oWall){
        x = x - 4;
    }
 
    if place_meeting(x-16,y+(sign(key_vert)*8),oWall){
        x = x + 4;
    }
 
}
else
{
    y += lengthdir_y(key_speed*playerSpeed,key_dir);
}
 
if (Key_Sprint){
    sprinting = true;
    playerSpeed = 8;
}
else{
    sprinting = false;
    playerSpeed = 5;
}
 
 
image_angle = point_direction(x,y,mouse_x,mouse_y);