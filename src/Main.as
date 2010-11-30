package 
{
	import flash.desktop.NativeApplication;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.Sprite;
	import flash.desktop.Updater;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jonanin
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			/*
			stage.nativeWindow.menu = new NativeMenu();

			var menuItem:NativeMenuItem = new NativeMenuItem("Hello!");
			
			var subMenu:NativeMenu = new NativeMenu();
			var btn1:NativeMenuItem = new NativeMenuItem("World");
			subMenu.addItem(btn1);
			menuItem.submenu = subMenu;s

			stage.nativeWindow.menu.addItem(menuItem);
			*/
		}
		
		private function init(e:Event):void
		{
			var app:MillBotApp = new MillBotApp(stage);
			app.start();
		}
		
	}
	
}