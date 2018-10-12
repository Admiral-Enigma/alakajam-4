package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
    public var playerWidth = 64;
    public var playerHeight = 64;

    public function new (x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(playerWidth, playerHeight, FlxColor.BLUE);

    }
}