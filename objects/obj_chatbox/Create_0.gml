//settings
on = false;
sansay = false;
spd = 30;
spriteo = spr_empty;
spriteoI = 0;

//var
myText = ["TestyToast"];
santext = "";

//var
choiceText = [];
choiceAnimIds = [];
dontAutoContinue = false;

//indexes
letterCurrentIndex = 0;
lineCurrentIndex = 0;

//single use vars
canSanTimer = true;
canLineTimer = true;
canClearTimer = true;

//initilize
depth = -room_height*2;

//profiles TEST
swapping = false;
swap_party_index = 0;
swap_x = 0;
swap_y = 0;