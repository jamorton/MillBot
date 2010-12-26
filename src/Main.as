package 
{
	import flash.desktop.NativeApplication;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.display.Sprite;
	import flash.desktop.Updater;
	import flash.events.Event;
	
	public class Main extends Sprite 
	{
		
		public function Main() 
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
			stage.nativeWindow.title = "MillBot AIR [ALPHA]";
			var app:MillBotApp = new MillBotApp(stage);
			app.start();
		}
		
	}
	
}