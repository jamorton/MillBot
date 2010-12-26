package  
{
	import element.Element;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.engine.ElementFormat;
	import tool.ITool;
	import tool.PointerTool;
	import tool.RectangleTool;

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
		
		private static var TOOLS:Vector.<ITool> = new <ITool>[
				new PointerTool(),
				new RectangleTool()
		];
		
		private var _grid:Grid;
		private var _currentTool:int;
		private var _elements:Vector.<Element>;
		public function Workspace()
		{
			if (TOOLS.length == 0)
				throw new Error("No workspace tools available");
			
			_grid  = new Grid();
			_currentTool = 0;
			_elements = new Vector.<Element>();
			addEventListener(MouseEvent.MOUSE_DOWN, evtMouseDown);
			addEventListener(MouseEvent.MOUSE_UP,   evtMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, evtMouseMove);
			addEventListener(MouseEvent.CLICK,      evtMouseClick);
			MillBotApp.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN, evtKeyDown);
		}
		
		public function addElement(e:Element):void
		{
			_elements.push(e);
			addChild(e);
		}
		
		public function getElementsAt(v:Vector2):Vector.<Element>
		{
			var elements:Vector.<Element> = new Vector.<Element>();
			var objs:Array = getObjectsUnderPoint(localToGlobal(v.toPoint()));
			for each (var obj:Object in objs)
			{
				if (obj is Element)
					elements.push(obj as Element);
			}
			return elements;
		}
		
		private function evtMouseClick(e:MouseEvent):void
		{ TOOLS[_currentTool].mouseClick(new Vector2(mouseX, mouseY)); }
	
		private function evtMouseDown(e:MouseEvent):void
		{ TOOLS[_currentTool].mouseDown(new Vector2(mouseX, mouseY)); }
		
		private function evtMouseUp(e:MouseEvent):void
		{ TOOLS[_currentTool].mouseUp(new Vector2(mouseX, mouseY)); }
		
		private function evtMouseMove(e:MouseEvent):void
		{ TOOLS[_currentTool].mouseMove(new Vector2(mouseX, mouseY)); }
		
		private function evtKeyDown(e:KeyboardEvent):void
		{
			if (e.charCode >= 49 && e.charCode <= 57)
			{
				var num:uint = e.charCode - 49;
				trace(num);
				if (TOOLS.length > num)
					_currentTool = num;
				return;
			}
		}
		
		public override function redraw():void
		{
			clear();
			graphics.lineStyle();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, SIZE_PIXELS_X, SIZE_PIXELS_Y);
			graphics.endFill();
			addChild(_grid);
			
			for each (var t:ITool in TOOLS)
				t.initialize();
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
		
		public function get currentTool():ITool { return TOOLS[_currentTool]; }
		
		public function get grid():Grid { return _grid; }
		
	}

}