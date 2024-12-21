spr = spr_char_leylow;
yDiff = 16*12;
xDiff = 0;

AI = 0;

Health = 100;
sylladex = [//test items
	[spr_empty, item_apple, item_spikeball, spr_empty],
	[item_needle, spr_empty, spr_empty, spr_empty],
	[spr_empty, spr_empty, spr_empty, spr_empty],
	[spr_empty, spr_empty, spr_empty, spr_empty],
];

myProfile = instance_create_depth(x, y, depth, obj_profile);
myProfile.owner = self;
myProfile.myPartyIndex = 1;
myProfile.image_index = 1;

//0: follow
//1: be a set amount of x and y away from the player

//Things for AI to take into account:
//Room and position in Room
//Surrounding Mons and Interactables
//[DODGE - FIGHT - EXPLORE - ITEMS] strats (behind profile card)
//Plot Point
//Who's the party leader + the quest at hand