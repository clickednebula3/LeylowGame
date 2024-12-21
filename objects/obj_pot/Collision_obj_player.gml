var bumpness = other.x - other.xprevious;

if ((alarm[0] <= 0 || saved_bumpness < abs(bumpness)) && abs(bumpness) > 0) {
	last_direction_right = abs(bumpness) / bumpness;
	saved_bumpness = abs(bumpness);
	alarm[0] = 0.25*sec*abs(bumpness);
}