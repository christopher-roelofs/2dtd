package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxStringUtil;
import openfl.Assets;
import flixel.FlxCamera;

class PlayState extends FlxState
{

	
	private  var tile_width:Int = 16;
	private  var tile_height:Int = 16;
	
	private var _collisionMap:FlxTilemap;
	
	private var _highlightBox:FlxSprite;
	
	private var _player:FlxSprite;
	
	override public function create():Void
	{
		_collisionMap = new FlxTilemap();
		
		_collisionMap.loadMap(Assets.getText("assets/default_auto.txt"), "assets/auto_tiles.png", tile_width, tile_height);
		add(_collisionMap);
		
		_player = new Player();
		add(_player);
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, 1);
		
		
		super.create();	
	}
	
	override public function destroy():Void
	{
		
	}
	
	override public function update():Void
	{
		FlxG.collide(_player, _collisionMap);
		
		if (FlxG.mouse.pressed)
		{
			// FlxTilemaps can be manually edited at runtime as well.
			// Setting a tile to 0 removes it, and setting it to anything else will place a tile.
			// If auto map is on, the map will automatically update all surrounding tiles.
			_collisionMap.setTile(Std.int(FlxG.mouse.x / tile_width), Std.int(FlxG.mouse.y / tile_height), FlxG.keys.pressed.SHIFT ? 0 : 1);
		}
		
		
		super.update();
		
	}
	
	
	override public function draw():Void 
	{
		super.draw();
		
	}
	
	
	

	
}