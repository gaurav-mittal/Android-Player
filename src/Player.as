package
{
	import filesystem.MusicLibrary;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	
	import flashx.textLayout.formats.Direction;
	
	[SWF(width=480, height=840, frameRate=30)]
	public class Player extends Sprite
	{
		public function Player()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageListener);
		}
		
		private function addedToStageListener(evt:Event):void{
			MusicLibrary.checkLibrary();
		}
		
		
	}
}