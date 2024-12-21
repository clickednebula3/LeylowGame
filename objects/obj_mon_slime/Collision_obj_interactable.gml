if (other.isItem && string_starts_with(sprite_get_name(other.spr), "item_apple")) {
	//ow an apple, I must now go back to sleep. I don't make the rules
	isSleeping = true;
	speed = 0;
}