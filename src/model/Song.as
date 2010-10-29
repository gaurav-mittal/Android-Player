package model
{
	import com.metaphile.id3.ID3Data;
	import com.metaphile.id3.ID3Reader;
	import com.metaphile.id3.ID3Writer;
	import com.metaphile.id3.utilities.ID3;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class Song
	{
		public var artist:String;
		public var album:String;
		public var name:String;
		
		private var _file:File;
		
		private var sound:Sound;
		private var id3:ID3Data;
		private var reader:ID3Reader;
				
		public function Song(p_file:File)
		{
			file = p_file;
		}
		
		public function set file(p_value:File):void{
			_file = p_value;
			
			id3 = new ID3Data();
			
			reader = new ID3Reader();
			
			
			
			
			}
		
		public function setID3(evt:Event):void{
			sound.removeEventListener(Event.COMPLETE, setID3);
								
			sound.close();
		}
	}
}