// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sylla_get_by_party_index(party_index){
	var chosen_sylladex = noone;
	with (obj_profile) { if (myPartyIndex == party_index) { chosen_sylladex = self; } }
	return chosen_sylladex;
}