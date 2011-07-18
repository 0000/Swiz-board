package com.flexstudy.board.event
{
	import flash.events.Event;
	
	public class BoardEvent extends Event
	{
		public static const GET_BOARD_CONTENT:String = "getBoardContent";
		public static const GET_BOARD_LIST:String = "getBoardList";
		public static const GET_BOARD_LIST_COMPLETE:String = "getBoardListComplete";
		
		/**
		 * Construct
		 */
		public function BoardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, true, cancelable);
		}
		
		
		/**
		 *
		 */
		public var seq:int;
		
		
		/**
		 * 
		 */
		public var bname:String;
		
		
		/**
		 * 
		 */
		public var pageNum:int;
	}
}