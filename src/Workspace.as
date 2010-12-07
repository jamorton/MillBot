package  
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import tool.ITool;
	import tool.Rectangle;

	public class Workspace extends Drawable
	{
		
		public static const SIZE_INCH_X:Number = 4.0;
		public static const SIZE_INCH_Y:Number = 4.0;
		
		public static const MIN_INCH_X:Number = -(SIZE_INCH_X / 2);
		public static const MIN_INCH_Y:Number = -(SIZE_INCH_Y / 2);
		public static const MAX_INCH_X:Number =  (SIZE_INCH_X / 2);
		public static const MAX_INCH_Y:Number =  (SIZE_INCH_Y / 2);
		
		public static const SIZE_PIXELS_X:Number = 500;
		public static const SIZE_PIXELS_Y:Number = 500;
		
		private static const TOOLS:Vector.<ITool> = <ITool>[
			new Rectangle()
		];

		private var _grid:Grid;
		private var _currentTool:int;
		
		public function Workspace()
		{
			if (TOOLS.length == 0)
				throw new Error("No workspace tools available");
			
			_grid  = new Grid();
			_currentTool = 0;
			addEventListener(MouseEvent.MOUSE_DOWN, evtMouseDown);
			addEventListener(MouseEvent.MOUSE_UP,   evtMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, evtMouseMove);
			redraw();
		}
		
		private function evtMouseDown(e:MouseEvent):void
		{
			TOOLS[_currentTool].mouseDown(e);
		}
		
		private function evtMouseUp(e:MouseEvent):void
		{
			TOOLS[_currentTool].mouseUp(e);
		}
		
		private function evtMouseMove(e:MouseEvent):void
		{
			TOOLS[_currentTool].mouseMove(e);
		}
		
		public override function redraw():void
		{
			clear();
			graphics.lineStyle();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, SIZE_PIXELS_X, SIZE_PIXELS_Y);
			graphics.endFill();
			addChild(_grid);
		}
		
		public static function ITP(v:Vector2):Vector2
		{
			return new Vector2(
				Util.scale(v.x, MIN_INCH_X, MAX_INCH_X, 0, SIZE_PIXELS_X),
				Util.scale(v.y, MIN_INCH_Y, MAX_INCH_Y, 0, SIZE_PIXELS_Y)
			);
		}
		
		public static function PTI(v:Vector2):Vector2
		{
			return new Vector2(
				Util.scale(v.x, 0, SIZE_PIXELS_X, MIN_INCH_X, MAX_INCH_X),
				Util.scale(v.y, 0, SIZE_PIXELS_Y, MIN_INCH_Y, MAX_INCH_Y)
			);
		}
		
		public function get currentTool():Class { return _currentTool; }
		
	}

}