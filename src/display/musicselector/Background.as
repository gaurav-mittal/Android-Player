package display.musicselector
{
	import core.Config;
	
	import display.ScreenManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import sweatless.display.graphics.SmartRectangle;
	import sweatless.utils.ColorUtils;
	
	public class Background extends SmartRectangle
	{
		public function Background()
		{
			super(20,20);
			
			colors = [Config.backgroundColor, ColorUtils.toDarken(Config.backgroundColor, 10)];
			
			fillRotation = -90;
			ScreenManager.autoAlign(this,  ScreenManager.TOP+ScreenManager.LEFT, null, new Point(.5,.5)); 
		}
	}
}