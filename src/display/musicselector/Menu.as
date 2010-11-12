package display.musicselector
{
	import core.Config;
	
	import display.ScreenManager;
	
	import flash.display.Sprite;
	
	import sweatless.display.graphics.SmartRectangle;
	import sweatless.display.graphics.SmartTriangle;
	import sweatless.layout.Align;
	
	public class Menu extends Sprite
	{
		private var detail:Sprite;
		private var detailMask:Sprite;
		private var detailRect:SmartRectangle;
		private var detailEdge:SmartTriangle;
		
		public function Menu()
		{
			super();
			
			detailMask = new Sprite();
			addChild(detailMask);
			detailRect = new SmartRectangle(ScreenManager.width, 100);
			detailMask.addChild(detailRect);
		}
	}
}