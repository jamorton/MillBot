package  
{
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class MillBotApp
	{
		
		private var _stage:Stage;
		private var _workspace:Workspace;
		
		private static var _instance:MillBotApp = null;
		
		public function MillBotApp(stage:Stage) 
		{
			_instance = this;
			_stage = stage;
			_workspace = new Workspace();
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			//_stage.addEventListener(Event.RESIZE
		}
		
		public static function get instance():MillBotApp
		{
			if (_instance == null)
				throw new Error("Access of MillBotApp instance without a valid application");
			return _instance;
		}
		
		public function start():void
		{
			_workspace.redraw();
			_stage.addChild(_workspace);
			_workspace.x = (_stage.stageWidth  - Workspace.SIZE_PIXELS_X) / 2;
			_workspace.y = (_stage.stageHeight - Workspace.SIZE_PIXELS_Y) / 2;
		}
		
		public function get workspace():Workspace { return _workspace; }
		
		public function get stage():Stage { return _stage; }
	}

}
