package android.flixel;

import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxColor;

class FlxVirtualPad extends FlxSpriteGroup {
	//Actions
	public var buttonA:FlxButton;
	public var buttonB:FlxButton;
	public var buttonC:FlxButton;
	public var buttonD:FlxButton;
	public var buttonE:FlxButton;
	public var buttonV:FlxButton;
	public var buttonX:FlxButton;
	public var buttonY:FlxButton;
	public var buttonZ:FlxButton;

	//DPad
	public var buttonLeft:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonDown:FlxButton;

	//PAD DUO MODE
	public var buttonLeft2:FlxButton;
	public var buttonUp2:FlxButton;
	public var buttonRight2:FlxButton;
	public var buttonDown2:FlxButton;

	public var dPad:FlxSpriteGroup;
	public var actions:FlxSpriteGroup;

	public var orgAlpha:Float = 0.75;
	public var orgAntialiasing:Bool = true;

	public function new(?DPad:FlxDPadMode, ?Action:FlxActionMode, ?alphaAlt:Float = 0.75, ?antialiasingAlt:Bool = true) {
		super();

		orgAntialiasing = antialiasingAlt;
		orgAlpha = alphaAlt;

		dPad = new FlxSpriteGroup();
		dPad.scrollFactor.set();

		actions = new FlxSpriteGroup();
		actions.scrollFactor.set();

		buttonA = new FlxButton(0, 0);
		buttonB = new FlxButton(0, 0);
		buttonC = new FlxButton(0, 0);
		buttonD = new FlxButton(0, 0);
		buttonE = new FlxButton(0, 0);
		buttonV = new FlxButton(0, 0);
		buttonX = new FlxButton(0, 0);
		buttonY = new FlxButton(0, 0);
		buttonZ = new FlxButton(0, 0);

		buttonLeft = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);

		buttonLeft2 = new FlxButton(0, 0);
		buttonUp2 = new FlxButton(0, 0);
		buttonRight2 = new FlxButton(0, 0);
		buttonDown2 = new FlxButton(0, 0);

        /*color
		buttonA = button.color(0xFF0000);
		buttonB = button.color(0xFFCB00);
		buttonC = button.color(0x44FF00);
		buttonD = button.color(0x0078FF);
		buttonE = button.color(0x44FF00);
		buttonV = button.color(0x49A9B2);
		buttonX = button.color(0x99062D);
		buttonY = button.color(0x4A39B9);
		buttonZ = button.color(0xCCB98E);

		buttonLeft = button.color(0xFF00FF);
		buttonUp = button.color(0x00FF00);
		buttonRight = button.color(0xFF0000);
		buttonDown = button.color(0x00FFFF);

		buttonLeft2 = button.color(0xFF00FF);
		buttonUp2 = button.color(0x00FF00);
		buttonRight2 = button.color(0xFF0000);
		buttonDown2 = button.color(0x00FFFF);*/

		switch (DPad){
			case UP_DOWN:
				dPad.add(add(buttonUp = createButton(0, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonDown = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case LEFT_RIGHT:
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(42 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
			case UP_LEFT_RIGHT:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
			case FULL:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case RIGHT_FULL:
				dPad.add(add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down")));
			case DUO:
				dPad.add(add(buttonUp = createButton(35 * 3, FlxG.height - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(0, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(69 * 3, FlxG.height - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(35 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
				dPad.add(add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 116 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft2 = createButton(FlxG.width - 128 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight2 = createButton(FlxG.width - 44 * 3, FlxG.height - 66 - 81 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 66 - 45 * 3, 44 * 3, 45 * 3, "down")));
			case NONE:
		}

		switch (Action){
			case A:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
			case B:
				actions.add(add(buttonB = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
			case D:
				actions.add(add(buttonD = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "d")));						
			case A_B:
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
			case A_B_C:
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));				
			case A_B_E:
				actions.add(add(buttonE = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "e")));   
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
 			case A_B_X_Y:
				actions.add(add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));	 			               
			case A_B_C_X_Y:		
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));				
			case A_B_C_X_Y_Z:
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));	
			case FULL:
				actions.add(add(buttonV = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "v")));            
				actions.add(add(buttonX = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonY = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonZ = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));
				actions.add(add(buttonD = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "d")));
				actions.add(add(buttonC = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonB = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));								
				actions.add(add(buttonA = createButton(FlxG.width - 44 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));						
			case CHART_EDITOR:
				actions.add(add(buttonZ = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));
				actions.add(add(buttonA = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonC = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonB = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonX = createButton(FlxG.width - 44 * 3, FlxG.height - 125 * 3, 44 * 3, 45 * 3, "x")));
				dPad.add(add(buttonUp = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight = createButton(FlxG.width - 45 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case CHARACTER_EDITOR:
				actions.add(add(buttonZ = createButton(FlxG.width - 128 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "z")));
				actions.add(add(buttonA = createButton(FlxG.width - 128 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "a")));
				actions.add(add(buttonY = createButton(FlxG.width - 170 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "y")));
				actions.add(add(buttonB = createButton(FlxG.width - 170 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "b")));
				actions.add(add(buttonX = createButton(FlxG.width - 212 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "x")));
				actions.add(add(buttonC = createButton(FlxG.width - 212 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "c")));
				actions.add(add(buttonV = createButton(FlxG.width - 253 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "v")));
				actions.add(add(buttonD = createButton(FlxG.width - 253 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "d")));
				dPad.add(add(buttonUp2 = createButton(FlxG.width - 86 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "up")));
				dPad.add(add(buttonLeft2 = createButton(FlxG.width - 44 * 3, FlxG.height - 85 * 3, 44 * 3, 45 * 3, "left")));
				dPad.add(add(buttonRight2 = createButton(FlxG.width - 45 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "right")));
				dPad.add(add(buttonDown2 = createButton(FlxG.width - 86 * 3, FlxG.height - 45 * 3, 44 * 3, 45 * 3, "down")));
			case NONE:
		}
	}

	public function createButton(x:Float, y:Float, width:Int, height:Int, frames:String):FlxButton {
		var button = new FlxButton(x, y);
		button.frames = FlxTileFrames.fromFrame(getFrames().getByName(frames), FlxPoint.get(width, height));
		button.resetSizeFromFrame();
		button.solid = false;
		button.immovable = true;
		button.scrollFactor.set();
		button.alpha = orgAlpha;
		button.antialiasing = orgAntialiasing;
		#if FLX_DEBUG
		button.ignoreDrawDebug = true;
		#end
		return button;
	}

	public static function getFrames():FlxAtlasFrames {
		return Paths.getPackerAtlas('androidcontrols/virtualpad');
	}

	override public function destroy():Void {
		super.destroy();

		dPad = FlxDestroyUtil.destroy(dPad);
		actions = FlxDestroyUtil.destroy(actions);

		dPad = null;
		actions = null;

		buttonA = null;
		buttonB = null;
		buttonC = null;
		buttonD = null;
		buttonE = null;

		buttonV = null;	
		buttonX = null;	
		buttonY = null;
		buttonZ	= null;	

		buttonLeft = null;
		buttonUp = null;
		buttonDown = null;
		buttonRight = null;

		buttonLeft2 = null;
		buttonUp2 = null;
		buttonDown2 = null;
		buttonRight2 = null;
	}
}

enum FlxDPadMode {
	UP_DOWN;
	LEFT_RIGHT;
	UP_LEFT_RIGHT;
	FULL;
	RIGHT_FULL;
	DUO;
	NONE;
}

enum FlxActionMode {
	A;
	B;
	D;
	A_B;
	A_B_C;
	A_B_E;
	A_B_X_Y;
	A_B_C_X_Y;
	A_B_C_X_Y_Z;
	FULL;
	CHART_EDITOR;
	CHARACTER_EDITOR;
	NONE;
}