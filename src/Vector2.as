package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jon Morton
	 */
	public class Vector2 extends Point
	{
		
		public function Vector2(x:Number, y:Number) 
		{
			super(x, y);
		}
		
		public function scale(sx:Number, sy:Number):Vector2
		{
			return new Vector2(x * sx, y * sy);
		}
		
	}

}