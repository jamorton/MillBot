package  
{
	import flash.geom.Point;

	public class Workspace
	{
		
		public static const SIZE_INCH_X:Number = 4.0;
		public static const SIZE_INCH_Y:Number = 4.0;
		
		private static const MIN_INCH_X:Number = -(SIZE_INCH_X / 2);
		private static const MIN_INCH_Y:Number = -(SIZE_INCH_Y / 2);
		private static const MAX_INCH_X:Number =  (SIZE_INCH_X / 2);
		private static const MIN_INCH_Y:Number =  (SIZE_INCH_Y / 2);
		
		public static const SIZE_PIXELS_X:Number = 500;
		public static const SIZE_PIXELS_Y:Number = 500;
		
		public function Workspace()
		{
			
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
		
	}

}