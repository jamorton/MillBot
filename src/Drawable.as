package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jon Morton
	 */
	public class Drawable extends Sprite
	{
		
		public function redraw():void
		{
			clear();
		}
		
		public function clear():void
		{
			graphics.clear();
			while (numChildren) removeChildAt(0);
		}
		
	}

}