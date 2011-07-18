package com.flexstudy.board.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.core.mx_internal;
	import mx.utils.ObjectUtil;

	use namespace mx_internal;
	
	public class BoardViewModel extends EventDispatcher
	{
		public function BoardViewModel()
		{
			super();
		}
		private var _seq:int;
		
		private var _writer:String;
		
		private var _content:String
		
		private var _pwd:String;
		
		private var _hit:int;
		
		private var _groups:String;
		
		private var _step:String;
		
		private var _level:String;
		
		private var _bname:String;
		
		private var _title:String;
		
		private var _regdate:String;
		
		[Bindable("change")]
		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

		[Bindable("change")]
		/**
		 * 
		 */
		public function get regdate():String
		{
			return _regdate;
		}
		public function set regdate(value:String):void
		{
			_regdate = value;
		}

		
		[Bindable("change")]
		/**
		 * 
		 */
		public function get bname():String
		{
			return _bname;
		}
		public function set bname(value:String):void
		{
			_bname = value;
		}

		
		[Bindable("change")]
		/**
		 * 
		 */
		public function get level():String
		{
			return _level;
		}
		public function set level(value:String):void
		{
			_level = value;
		}

		[Bindable("change")]
		/**
		 * 
		 */
		public function get step():String
		{
			return _step;
		}
		public function set step(value:String):void
		{
			_step = value;
		}
		
		
		[Bindable("change")]
		/**
		 * 
		 */
		public function get groups():String
		{
			return _groups;
		}
		public function set groups(value:String):void
		{
			_groups = value;
		}

		
		[Bindable("change")]
		/**
		 * 
		 */
		public function get hit():int
		{
			return _hit;
		}
		public function set hit(value:int):void
		{
			_hit = value;
		}

		
		[Bindable("change")]
		/**
		 * 
		 */
		public function get content():String
		{
			return _content;
		}
		public function set content(value:String):void
		{
			_content = value;
		}

		[Bindable("change")]
		/**
		 * 
		 */
		public function get writer():String
		{
			return _writer;
		}

		[Bindable("change")]
		/**
		 * 
		 */
		public function get seq():int
		{
			return _seq;
		}
		public function set seq(value:int):void
		{
			_seq = value;
		}
		
		
		/**
		 * 
		 */
		mx_internal function applyFromXML(data:XML):void
		{
			_seq = data.child("seq");//children()[0];
			_writer = data.child("writer");
			_title = data.child("title");
			_content = data.child("content");
			_hit = data.child("hit");
			_groups = data.child("groups");
			_step = data.child("step");
			_level = data.child("level");
			_regdate = data.child("regdate");
			
			dispatchEvent(new Event("change"));
		}

	}
}