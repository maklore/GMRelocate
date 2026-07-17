/**
* Transports
* @returns {struct.GMRelocate}
*/
function GMRelocate(){
	
	static __transporter = undefined;
	
	if __transporter != undefined {
		return __transporter;	
	}
	
	static __target = {
		room : undefined,
		id : undefined,
		collide : false,
		player : undefined
	}
	
	/**
	* Set player object.
	* @param {asset.object} _player Player object.
	*/
	static init = function(_player) {
		__target.player = _player;	
	}
	
	/**
	* Go to target room and select target object.
	* @param {asset.object | id.instance} _object Target object or instance.
	* @param {asset.room} _room Target room.
	*/
	static goto = function(_object_or_instance, _room = noone) {
		if __target.collide { exit; }
		__target.room	 = _room;
		__target.id		 = _object_or_instance;
		__target.collide = true;
		if _room != noone {
			room_goto(_room);
		} else {
			relocate();
		}
	}
	
	/**
	* Reset relocation ability when no longer colliding with target object.
	*/
	static reset = function() {
		if __target.id == undefined { exit; }
		with __target.player {
			if instance_place(x, y, other.__target.id) == noone {
				other.__target.room	   = undefined;
				other.__target.id	   = undefined;
				other.__target.collide = false;
			}
		}
	}
	
	/**
	* Relocate to target object on room start.
	*/
	static relocate = function() {
		
		if __target.id == undefined {
			exit;	
		}
		if !instance_exists(__target.id) {
			if is_undefined(__target.id)
			show_debug_message($"{__target.id} does not exist."); 
			exit; 
		}
		var _target_center = __target.id.bbox_left + __target.id.sprite_width  * 0.5;
		var _target_middle = __target.id.bbox_top  + __target.id.sprite_height * 0.5;
		__target.player.x = _target_center;
		__target.player.y = _target_middle;

	}
		
	__transporter = static_get(GMRelocate);

}

GMRelocate();
