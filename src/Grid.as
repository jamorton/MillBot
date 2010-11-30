package  
{
	import flash.display.Sprite;

	public class Grid extends Drawable
	{
		
		private var _spacing:Number;
		
		public function Grid() 
		{
			_spacing = 1.0;
		}
		
		public function get spacing():Number { return _spacing; }
		
		public function set spacing(value:Number):void 
		{
			_spacing = value;
		}
		
		public function redraw():void
		{
			clear();
			
		}
		
		
		
	}

}