package display
{
	import flash.display.DisplayObject;
	import flash.display.NativeWindow;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.NativeWindowBoundsEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.geom.Point;

	public class ScreenManager
	{
		private static var window:NativeWindow;
		private static var stage:Stage;
		private static var alignObjects:Vector.<AlignObject>;
		
		public static const TOP:uint = 1;
		public static const BOTTOM:uint = 2;
		
		public static const LEFT:uint = 10;
		public static const RIGHT:uint = 20;
		
		public static const CENTER:uint = 100;
		public static const NONE:uint = 0;
		
		public static function init(p_stage:Stage):void{
			if(stage) return;
			window = p_stage.nativeWindow;
			stage = p_stage;
			
			if(window){
				window.addEventListener(NativeWindowBoundsEvent.RESIZE, resizeListener);
				window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE, resizeListener);
			}else{
				stage.addEventListener(Event.RESIZE, resizeListener);
				stage.addEventListener(FullScreenEvent.FULL_SCREEN, resizeListener);
			}
		}
		
		private static function resizeListener(evt:Event):void{
			alignAllObjects();
		}
		
		private static function alignAllObjects():void{
			for(var i:int = 0; i<alignObjects.length; i++){
				alignObject(alignObjects[i].object, alignObjects[i].position, alignObjects[i].offset);
				if(alignObjects[i].scale) resizeObject(alignObjects[i].object, alignObjects[i].scale, alignObjects[i].sizeAdd);
			}
		}
		
		public static function alignObject(p_object:DisplayObject, p_anchor:uint, p_offset:Point=null):void{
			var _offset:Point = p_offset ? p_offset : new Point();
			
			var horizontal:uint = Math.floor((p_anchor%100)/10);
			var vertical:uint = (p_anchor%100)%10;
			var center:Boolean = p_anchor>=100;
			
			if(horizontal==2){
				p_object.x = stage.getRect(stage).left;
			}
			
			
		}
		
		public static function resizeObject(p_object:DisplayObject, p_scale:Point, p_sizeAdd:Point):void{
			
		}
		
		
		public static function get width():Number{
			if(!window && !stage) return 0;
			if(window){
				return window.width;
			}else if(stage.displayState == StageDisplayState.FULL_SCREEN){
				return stage.fullScreenWidth;				
			}else{
				return stage.stageWidth;
			}
		}
		
		public static function get height():Number{
			if(!window && !stage) return 0;
			if(window){
				return window.height;
			}else if(stage.displayState == StageDisplayState.FULL_SCREEN){
				return stage.fullScreenHeight;				
			}else{
				return stage.stageHeight;
			}
		}
		
		public static function autoAlign(p_object:DisplayObject, p_position:uint, p_offset:Point=null, p_scale:Point=null, p_sizeAdd:Point=null, p_killWhenRemoved:Boolean=true):void{
			if(!alignObjects) alignObjects = new Vector.<AlignObject>();
			alignObjects.push(new AlignObject(p_object, p_position, p_offset, p_scale, p_sizeAdd, p_killWhenRemoved));
			if(stage) return;
			
			if(p_object.stage){
				init(p_object.stage);
				return;
			}			
			p_object.addEventListener(Event.ADDED_TO_STAGE, getStageFromObject);
		}
		
		private static function getStageFromObject(evt:Event):void{
			evt.currentTarget.removeEventListener(Event.ADDED_TO_STAGE, getStageFromObject);
			init(evt.currentTarget.stage);
		}
	}
}
import flash.display.DisplayObject;
import flash.geom.Point;

internal class AlignObject{
	public var object:DisplayObject;
	public var position:uint;
	public var offset:Point;
	public var scale:Point;
	public var sizeAdd:Point;
	public var killWhenRemoved:Boolean;
	
	public function AlignObject(p_object:DisplayObject, p_position:uint, p_offset:Point, p_scale:Point, p_sizeAdd:Point, p_killWhenRemoved:Boolean){
		object = p_object;
		position = p_position;
		offset = p_offset;
		scale = p_scale;
		sizeAdd = p_sizeAdd;
		killWhenRemoved = p_killWhenRemoved;
	}
}