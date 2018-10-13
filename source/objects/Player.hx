package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxTimer;

class Player extends FlxSprite
{
    public var playerWidth = 64;
    public var playerHeight = 64;
    public var playerAttackBox:FlxSprite;
    public static inline var ATTACKHOLD:Float = 0.1;

    public function new (x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(playerWidth, playerHeight, FlxColor.BLUE);
        immovable = true;
        playerAttackBox = new FlxSprite(x, y + playerHeight);
        playerAttackBox.makeGraphic(playerWidth, playerHeight, FlxColor.RED);
        playerAttackBox.immovable = true;
        Global.PS.add(playerAttackBox);
    }

    override public function update(elapsed:Float):Void 
    {
        super.update(elapsed);
        if (FlxG.keys.justPressed.LEFT) 
        {
            playerAttackBox.setPosition(this.x - playerWidth, this.y);
            new FlxTimer().start(ATTACKHOLD, resetHitbox, 1);
        } else if (FlxG.keys.justPressed.RIGHT)
        {
            playerAttackBox.setPosition(this.x + playerWidth, this.y);
            new FlxTimer().start(ATTACKHOLD, resetHitbox, 1);
        }
    }

    function resetHitbox(Timer:FlxTimer):Void
    {
        playerAttackBox.setPosition(this.x, this.y + playerHeight);
    }
}