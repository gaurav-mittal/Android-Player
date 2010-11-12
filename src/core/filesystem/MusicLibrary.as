package core.filesystem
{
	import flash.filesystem.File;
	
	import model.Song;

	public class MusicLibrary
	{
		private static var _instance:MusicLibrary;
		
		private static var songs:Vector.<Song>;
		
		
		public function MusicLibrary()
		{
			_instance = this;
		}
		
		
		public static function checkLibrary():void{
			instance.checkLibrary();
		}
		
		private function checkLibrary():void{
			var appData:File = new File(File.applicationStorageDirectory.nativePath + "/library.hustle");
			if(appData.exists) {
				
			}else{
				checkForNewMusic();
			}
		}
		
		public static function checkForNewMusic():void{
			instance.checkForNewMusic();
		}
		
		private function checkForNewMusic():void{
			var musicDirectory:File = new File(File.userDirectory.nativePath + "/Music");
			
			songs = new Vector.<Song>();
			
			processFileByType(musicDirectory);
		}
		
		private function processFileByType(file:File):void{
			if(file.isDirectory){
				getMusicInFolder(file);
				return;
			}else if(file.isHidden || file.isPackage || file.isSymbolicLink){
				return;
			}else{
				addToLibrary(file);
			}
		}
		
		private function getMusicInFolder(folder:File):void{
			var folderContents:Array = folder.getDirectoryListing();
			for(var i:int=0; i<folderContents.length; i++){
				processFileByType(folderContents[i]);
			}
		}
		
		private function addToLibrary(file:File):void{
			switch(file.extension){
				case "mp3":
					songs.push(new Song(file));
					break;
			}
		}
		
		private static function get instance():MusicLibrary{
			if(_instance){
				return _instance;
			}else{
				return new MusicLibrary();
			}
		}
	}
}