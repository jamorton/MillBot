package  
{
	import flash.display.Sprite;
	public class Grid extends Drawable
	{
		
		private var _spacing:Number;
		
		public function Grid() 
		{
			spacing = 0.5;
		}
		
		private function get pixelSpacing():Vector2
		{
			return Workspace.ITP(
				new Vector2(_spacing + Workspace.MIN_INCH_X,
				            _spacing + Workspace.MIN_INCH_Y)
			);
		}
		
		public function get spacing():Number { return _spacing; }
		
		public function set spacing(value:Number):void 
		{
			_spacing = value;
			redraw();
		}
		
		public function snap(v:Vector2):Vector2
		{
			var s:Vector2 = pixelSpacing;
			return new Vector2(
				Math.floor(v.x / s.x + 0.5) * s.x,
				Math.floor(v.y / s.y + 0.5) * s.y
			);
		}
		
		public override function redraw():void
		{
			clear();
			graphics.lineStyle(1, 0xCFCFCF);
			
			var i:Number, start:Vector2, end:Vector2;
			var pSpacing:Vector2 = pixelSpacing;
			
			for (i = pSpacing.x; i < Workspace.SIZE_PIXELS_X; i += pSpacing.x)
			{
				graphics.moveTo(i, 0);
				graphics.lineTo(i, Workspace.SIZE_PIXELS_Y);
			}
			
			for (i = pSpacing.y; i < Workspace.SIZE_PIXELS_Y; i += pSpacing.y)
			{
				graphics.moveTo(0, i);
				graphics.lineTo(Workspace.SIZE_PIXELS_X, i);
			}	
		}	
		
	}

}