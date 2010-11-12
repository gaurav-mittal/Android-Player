package display.musicselector
{
	
	import display.ScreenManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MusicSelector extends Sprite
	{
		private var background:Background;
		private var menu:Menu;
		
		public function MusicSelector()
		{
			super();
			
			background = new Background();
			
			addChild(background);
			
			menu = new Menu();
			addChild(menu);
		}
	}
}