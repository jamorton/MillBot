package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jon Morton
	 */
	public class Drawable extends Sprite
	{
		
		public function Drawable() 
		{
			
		}
		
		public function redraw():void
		{
			
		}
		
		public function clear():void
		{
			graphics.clear();
			while (numChildren) removeChildAt(0);
		}
		
	}

}