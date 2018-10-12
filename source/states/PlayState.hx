package states;

import flixel.FlxState;
import objects.Player;
import flixel.FlxG;

class PlayState extends FlxState
{
	public var player:Player;
	public static inline var gameWidth = 410;
	public static inline var gameHeight = 710;

	override public function create():Void
	{
		FlxG.mouse.visible = false;
		player = new Player(gameWidth / 2 - 32, gameHeight / 2 - 32);
		add(player);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
