package states;

import flixel.FlxState;
import objects.Player;
import objects.Pineapple;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	public var player:Player;
	public var pineapples:FlxTypedGroup<Pineapple>;
	public static inline var gameWidth = 410;
	public static inline var gameHeight = 710;

	override public function create():Void
	{
		FlxG.mouse.visible = false;
		Global.PS = this;
		player = new Player(gameWidth / 2 - 32, gameHeight / 2 - 32);
		pineapples = new FlxTypedGroup<Pineapple>();
		add(player);
		add(pineapples);
		super.create();
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(pineapples, player.playerAttackBox, pineappleHit);
		if (FlxG.keys.justPressed.A) {
			pineapples.add(new Pineapple(128, 1));
		} else if (FlxG.keys.justPressed.D) {
			pineapples.add(new Pineapple(128, -1));
		}
	}

	function pineappleHit (pine:FlxSprite, _)
	{
		pine.kill();
		//TODO: Up score and so on
	}
}
