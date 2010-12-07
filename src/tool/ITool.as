package tool 
{
	import flash.events.MouseEvent;

	public interface ITool
	{
		
		public function initialize():void { }
		public function mouseDown(e:MouseEvent):void { }
		public function mouseUp(e:MouseEvent):void { }
		public function mouseMove(e:MouseEvent):void { }
		
	}

}

