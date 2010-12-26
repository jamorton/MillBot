
package element 
{

	public class RectElement extends Element
	{
		
		private var _start:Vector2;
		private var _end:Vector2;
		private var _size:Vector2;
		
		public function RectElement(start:Vector2, end:Vector2)
		{
			_start = start;
			_end   = end;
			_size  = _end.subtract(_start);
			redraw();
		}
		
		public override function redraw():void
		{
			clear();
			x = start.x;
			y = start.y;
			
			if (_selected)
				graphics.lineStyle(1, 0xAA44CC);
			else
				graphics.lineStyle(1, 0);
				
			graphics.beginFill(0, 0.2);
			graphics.drawRect(0, 0, size.x, size.y);
			graphics.endFill();
		}
		
		public override function toString():String
		{
			return "Rectangle " + size;
		}
		
		public function get start():Vector2 { return _start; }
		
		public function get end():Vector2 { return _end; }
		
		public function get size():Vector2 { return _size }
		
		public function set start(value:Vector2):void 
		{
			_start = value;
			_size  = _end.subtract(_start);
			redraw();
		}
		
		public function set end(value:Vector2):void 
		{
			_end = value;
			_size  = _end.subtract(_start);
			redraw();
		}
		
		public function set size(value:Vector2):void
		{
			_size = value;
			_end  = _start.add(_size);
			redraw();
		}
		
	}

}