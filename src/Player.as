package
{
	import core.Config;
	import core.Screens;
	import core.filesystem.MusicLibrary;
	
	import display.musicselector.MusicSelector;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.text.TextField;
	import display.ScreenManager;
	
	
	public class Player extends Sprite
	{
		private var musicSelector:MusicSelector;
		
		public function Player()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageListener);
//			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;	
		}
		
		private function addedToStageListener(evt:Event):void{
			changeScreen(Screens.MUSIC_SELECTOR);
		}
		
		private function changeScreen(p_newScreen:String):void{
			switch(p_newScreen){
				case Screens.MUSIC_SELECTOR:
					musicSelector = new MusicSelector();
					addChild(musicSelector);
					break;
			}
		}
	}
}