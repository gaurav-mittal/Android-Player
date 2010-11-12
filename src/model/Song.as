package model
{
	import com.fusiox.media.ID3Reader;
	import com.fusiox.media.ID3Stream;
	
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
		
		private var id3:ID3Stream;
		private var reader:ID3Reader;
				
		public function Song(p_file:File)
		{
			file = p_file;
		}
		
		public function set file(p_value:File):void{
			_file = p_value;
			
			id3 = new ID3Stream();
			id3.load(new URLRequest(_file.url));
			id3.addEventListener(Event.ID3, setID3);
			
			}
		
		public function setID3(evt:Event):void{
			name = id3.reader.frames["TIT2"]["text"];
			artist = id3.reader.frames["TPE1"]["text"];
			album = id3.reader.frames["TALB"]["text"];
			for(var i:String in id3.reader.frames){
				//trace(i, id3.reader.frames[i].text);
			}
			
		}
	}
}