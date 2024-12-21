#macro sec			game_get_speed(gamespeed_fps)

//settings
spd = 4;
Health = 90;
Healthprevious = 89;

behindGrastickusAmount = 0;
infrontGrastickusAmount = 0;

frozen = false;
can_control_camera = true;
hasHat = true;//should start with no hat, debugging purposes, remove later
screenMoveMode = false;
facing = "down";

X1=-8;
Y1=8;
X2=8;
Y2=8;

/*Profiles TEST*/
myProfile = instance_create_depth(x, y, depth, obj_profile);
myProfile.owner = self;
myProfile.myPartyIndex = 0;
myProfile.image_index = 0;

fetch = 0;//clamp 0, 3
sylladex = [
	[spr_empty, spr_empty, spr_empty, spr_empty],
	[spr_empty, spr_empty, spr_empty, spr_empty],
	[spr_empty, spr_empty, spr_empty, spr_empty],
	[spr_empty, spr_empty, spr_empty, spr_empty],
];
/*Profiles END*/

inventory = [];
seenAnimations = [];
invIndex = 0;
rightHeld = false;
clickRadius = 32*4;

//consts
collLeft=-12;
collRight=12;
collUp=-8;
collDown=6;
//layerables = [obj_interactable, obj_room_manager];

//derp
bucketslimehappy = false;
bucketslimecolor = c_white;