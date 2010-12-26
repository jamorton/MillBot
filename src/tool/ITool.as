package tool 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public interface ITool
	{
		
		function initialize():void;
		function mouseDown(v:Vector2):void;
		function mouseUp(v:Vector2):void;
		function mouseClick(v:Vector2):void;
		function mouseMove(v:Vector2):void;
		
	}

}