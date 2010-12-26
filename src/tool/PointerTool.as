package tool 
{
	import element.Element;
	import flash.display.NativeMenu;
	import flash.display.NativeMenuItem;
	import flash.events.Event;
	
	public class PointerTool extends BasicTool
	{
		
		private var selected:Element;
		
		public override function initialize():void
		{
			selected = null;
		}
		
		public override function mouseClick(v:Vector2):void
		{
			var elements:Vector.<Element> = workspace.getElementsAt(v);
			if (elements.length == 0)
				return;
				
			if (elements.length == 1)
			{
				select(elements[0]);
				return;
			}
			
			var menu:NativeMenu = new NativeMenu();
			for each (var el:Element in elements)
			{
				var item:NativeMenuItem = new NativeMenuItem(el.toString());
				item.data = el;
				menu.addItem(item);
			}
			menu.addEventListener(Event.SELECT, function (e:*):* { select(e.target.data) });
			menu.display(MillBotApp.instance.stage, v.x, v.y);
		}
		
		private function select(elem:Element):void
		{
			if (elem == selected)
			{
				elem.selected = false;
				selected = null;
			}
			else
			{
				if (selected != null)
					selected.selected = false;
				elem.selected = true;
				selected = elem;
			}
		}
		
	}

}