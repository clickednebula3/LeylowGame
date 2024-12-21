///@description stop

if (instance_exists(obj_player) && spriteo == spr_empty && on)
{ obj_player.frozen = false; }

on=false;
myText=[""];
santext="";
letterCurrentIndex = 0;
lineCurrentIndex = 0;
spd=30;

canSanTimer=true;
canLineTimer=true;
canClearTimer=true
