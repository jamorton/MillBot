package  
{
	/**
	 * ...
	 * @author Jon Morton
	 */
	public class Util
	{
		
		public static function scale(
			x:Number,
			imin:Number,
			imax:Number,
			omin:Number,
			omax:Number):Number
		{
			return (x - imin) * (omax - omin) / (imax - imin) + omin;
		}
		
	}

}