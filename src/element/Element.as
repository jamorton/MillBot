package element 
{
	import flash.display.Sprite;
	
	public class Element extends Drawable
	{
		
		protected var _selected:Boolean;
		
		public override function toString():String
		{
			return "Element";
		}
		
		public function get selected():Boolean { return _selected; }
		
		public function set selected(value:Boolean):void 
		{
			_selected = value;
			redraw();
		}
		
	}

}