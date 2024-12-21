var animatable = instance_create_layer(((bbox_right+bbox_left)/2)+xOff, ((bbox_top+bbox_bottom)/2)+yOff, "Instances", obj_animatable);

animatable.spr = spr;
animatable.sprI = sprI;
animatable.alph = alph;
animatable.playOnce = playOnce;
animatable.canDepth = canDepth;
animatable.animationId = animationId;
animatable.animationMoves = animationMoves;
animatable.createPartyMember = createPartyMember;
animatable.sprPartyMember = sprPartyMember;

instance_destroy();