///@arg str Array list of strings to show
///@arg {bool} sansay Whether the Text should be written over time rather than instantly
///@arg {real} sped the speed to write the text, if it is set to be written over time
///@arg sprit the 64px sprite to draw on the text box (-1 for none)
///@arg {real} spritI the image index of the sprite to draw on the text box
///@arg choiceStr ?Array list of strings to show in the option boxes
///@arg choiceAnims ?Array list of the ids that the players get if they select the corrosponding choiceStr
///@arg {bool} dontAutoClear ?Whether the textbox should stay and wait for user input

function scr_textbox(str = ["Error, script function called without string input"], sansay = false, sped = 30, sprit = spr_empty, spritI = 0, choiceStr = [], choiceAnims = [], dontAutoClear = false)
{
	if(instance_exists(obj_chatbox))
	{
		obj_chatbox.on = true;
		obj_chatbox.myText = str;
		obj_chatbox.spd = sped;
		obj_chatbox.sansay = sansay;
		obj_chatbox.santext = "";
		obj_chatbox.spriteo = sprit;
		obj_chatbox.spriteoI = spritI;
		
		//obj_chatbox.choiceForceWait = choicePause;
		obj_chatbox.choiceText = choiceStr;
		obj_chatbox.choiceAnimIds = choiceAnims;
		obj_chatbox.dontAutoContinue = dontAutoClear;
	
		obj_chatbox.letterCurrentIndex = 1;
		obj_chatbox.lineCurrentIndex = 0;
		
		obj_chatbox.canSanTimer = true;
		obj_chatbox.canLineTimer = !dontAutoClear;
		obj_chatbox.canClearTimer = true;
		
		obj_chatbox.alarm[0]=-1;
		obj_chatbox.alarm[1]=-1;
		obj_chatbox.alarm[2]=-1;
		
		if (instance_exists(obj_player)) { obj_player.frozen = true; }
	}
}