package  {
	//importing display elements that we can use in this class
	import flash.display.*;
	//importing flash events that we can use (like ENTER_FRAME)
	import flash.events.*;
	
	public class Brick extends MovieClip {
		
		private var _root:MovieClip;
		
		public function Brick() {
			addEventListener(Event.ADDED,beginClass);
			addEventListener(Event.ENTER_FRAME, enterFrameEvents);
			
		}
		
		private function beginClass(event:Event):void{
			_root = MovieClip(root);
			_root.brickAmt++;
			
		}
		
		private function enterFrameEvents(event:Event):void{
			if(_root.gameOver){
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
			}
			
			if(this.hitTestObject(_root.ball)){
				_root.ballYSpeed *= -1;
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, enterFrameEvents);
				_root.brickAmt--;
				_root.score += 10;
			}
		}
	}	
}
