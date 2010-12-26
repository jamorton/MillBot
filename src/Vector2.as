package  
{
	import flash.geom.Point;
	
	public class Vector2
	{
		
		private var _x:Number;
		private var _y:Number;
		
		public function Vector2(x:Number = 0, y:Number = 0) 
		{
			_x = x;
			_y = y;
		}
		
		public function toPoint():Point
		{
			return new Point(_x, _y);
		}
		
		public function clone():Vector2
		{
			return new Vector2(_x, _y);
		}
		
		public function equals(other:Vector2):Boolean
		{
			return _x == other.x && _y == other.y;
		}
		
		public function invert():Vector2
		{
			return new Vector2(-_x, -_y);
		}
		
		public function scale(s:Number):Vector2
		{
			return new Vector2(_x * s, _y * s);
		}
		
		public function add(v:Vector2):Vector2
		{
			return new Vector2(_x + v.x, _y + v.y);
		}
		
		public function subtract(v:Vector2):Vector2
		{
			return new Vector2(_x - v.x, _y - v.y);
		}
		
		public function multiply(v:Vector2):Vector2
		{
			return new Vector2(_x * v.x, _y * v.y);
		}
		
		public function divide(v:Vector2):Vector2
		{
			return new Vector2(_x / v.x, _y / v.y);
		}
		
		public static function interpolate(v1:Vector2, v2:Vector2, f:Number):Vector2
		{
			return new Vector2(
				v1.x * (1 - f) + v2.x * f,
				v1.y * (1 - f) + v2.y * f
			);
		}
		
		public static function distance(v1:Vector2, v2:Vector2):Number
		{
			var dx:Number = v1.x - v2.x;
			var dy:Number = v1.y - v2.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
		
		public function abs():Vector2
		{
			return new Vector2(Math.abs(_x), Math.abs(_y));
		}
		
		public function toString():String
		{
			return "(" + _x + ", " + _y + ")";
		}
		
		/*** getters / setters ***/
		
		public function get x():Number { return _x; }
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function get y():Number { return _y; }
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
		
	}

}