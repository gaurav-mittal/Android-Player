package model
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLRequest;
	
	import me.markezine.loadsequence.SequencedSound;

	public class Song
	{
		public var artist:String;
		public var album:String;
		public var name:String;
		
		private var _file:File;
		
		private var loader:SequencedSound;
				
		public function Song(p_file:File)
		{
			file = p_file;
		}
		
		public function set file(p_value:File):void{
			_file = p_value;
			loader = new SequencedSound();
			loader.load(new URLRequest(_file.nativePath));
			loader.addEventListener(Event.COMPLETE, setID3);
		}
		
		public function setID3(evt:Event):void{
			loader.removeEventListener(Event.COMPLETE, setID3);
			artist = loader.id3.artist;
			album = loader.id3.album;
			name = loader.id3.songName;
		}
	}
}