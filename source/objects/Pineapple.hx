package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;

class Pineapple extends FlxSprite 
{
    private var _dir:Float;
    private var launchAngle:Float;

    // Constants in haxe is still a joke
    private static inline var GRAVITY:Int = 400;
    private static inline var LAUNCH_SPEED:Int = 200;
    
    // dir can be 1 or -1 depending on which side you want to launch from
    public function new (y:Float, dir:Float)
    {
        super(0, y);
        makeGraphic(32, 32, FlxColor.YELLOW);
        _dir = dir;
        acceleration.y = GRAVITY;
        maxVelocity.y = GRAVITY * 2;
        
        if (_dir == 1)
        {
            launchAngle = 45;
        } else 
        {
            launchAngle = 45 * 3;
        }
        velocity.set(LAUNCH_SPEED, 0);
        velocity.rotate(FlxPoint.weak(0, 0), launchAngle);
    }
}