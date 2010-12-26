package tool 
{
	import element.RectElement;
	import flash.display.Sprite;

	public class RectangleTool extends BasicTool
	{
		
		private var _s:Sprite;
		private var _start:Vector2;
		
		public override function initialize():void
		{
			_start = null;
			_s = new Sprite();
			workspace.addChild(_s);
		}
		
		public override function mouseClick(v:Vector2):void
		{
			v = workspace.grid.snap(v);
			if (_start == null)
			{
				_start = v;
			}
			else
			{
				if (!_start.equals(v))
				{
					// swap start and end so start is always closer to origin (non-neg size)
					var t:Number;
					if (_start.x > v.x)
					{
						t = _start.x;
						_start.x = v.x;
						v.x = t;
					}
					if (_start.y > v.y)
					{
						t = _start.y;
						_start.y = v.y;
						v.y = t;
					}
					workspace.addElement(new RectElement(_start, v));
				}
				_s.graphics.clear();
				_start = null;
			}
		}
		
		public override function mouseMove(v:Vector2):void
		{
			v = workspace.grid.snap(v);
			if  (_start == null)
				return;
			
			var size:Vector2 = v.subtract(_start);
			_s.graphics.clear();
			_s.graphics.lineStyle(1, 0);
			_s.graphics.moveTo(_start.x, _start.y);
			_s.graphics.lineTo(v.x, v.y);
			_s.graphics.drawRect(_start.x, _start.y, size.x, size.y);
		}
		
	}

}
