package tool 
{
	/**
	 * ...
	 * @author Jon Morton
	 */
	public class BasicTool implements ITool
	{
		public function initialize():void {};
		public function mouseDown(v:Vector2):void {};
		public function mouseUp(v:Vector2):void {};
		public function mouseClick(v:Vector2):void {};
		public function mouseMove(v:Vector2):void {};
		
		protected function get workspace():Workspace { return MillBotApp.instance.workspace; }
		
	}

}