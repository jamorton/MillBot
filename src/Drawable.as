package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Jon Morton
	 */
	public interface Drawable extends Sprite
	{
		
		public function Drawable() 
		{
			
		}
		
		public function redraw()
		{
			
		}
		
		public function clear():void
		{
			graphics.clear();
			while (numChildren) removeChildAt(0);
		}
		
	}

}