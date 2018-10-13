package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Player extends FlxSprite
{
    public var playerWidth = 64;
    public var playerHeight = 64;
    public var playerAttackBox:FlxSprite;

    public function new (x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(playerWidth, playerHeight, FlxColor.BLUE);
        playerAttackBox = new FlxSprite(x - playerWidth, y);
        playerAttackBox.makeGraphic(playerWidth, playerHeight, FlxColor.RED);
        Global.PS.add(playerAttackBox);
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);
        if (FlxG.keys.justPressed.LEFT) 
        {
            playerAttackBox.x = this.x - playerWidth;
        } else if (FlxG.keys.justPressed.RIGHT)
        {
            playerAttackBox.x = this.x + playerWidth;
        }
    }
}