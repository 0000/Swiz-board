package com.flexstudy.board.controller
{
	import com.flexstudy.board.event.BoardEvent;
	import com.flexstudy.board.model.BoardListModel;
	import com.flexstudy.board.model.BoardViewModel;
	
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.core.mx_internal;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.ObjectUtil;
	
	import org.swizframework.utils.services.ServiceHelper;

	public class BoardController
	{
		[Dispatcher]
		/**
		 * 
		 */
		public var dispatcher:IEventDispatcher;
		

		[Inject]
		/**
		 * 
		 */
		public var boardListModel:BoardListModel;
		
		
		[Inject]
		/**
		 * 
		 */
		public var boardViewModel:BoardViewModel;
		
		
		[Inject(source="listService")]
		/**
		 * 
		 */
		public var listService:HTTPService;
		
		
		[Inject(source="getContentService")]
		/**
		 * 
		 */
		public var getContentService:HTTPService;
		
		
		[Inject]
		/**
		 * 헬퍼
		 */
		public var serviceHelper:ServiceHelper;
		
		
		[PostConstruct]
		/**
		 * 
		 */
		public function init():void
		{
			var listEvent:BoardEvent = new BoardEvent(BoardEvent.GET_BOARD_LIST);
			listEvent.pageNum = 1;
			dispatcher.dispatchEvent(listEvent);
		}
		
		
		[EventHandler(event="BoardEvent.GET_BOARD_CONTENT", properties="seq, bname")]
		/**
		 * 
		 */
		public function getContent(seq:int, bname:String):void
		{
			serviceHelper.executeServiceCall(getContentService.send({seq:seq, bname:bname}),
				contentResultHandler, contentFaultHandler);
		}
		
		
		/**
		 * 
		 */
		public function contentResultHandler(event:ResultEvent):void
		{
			var resultData:XML = event.result as XML;
			boardViewModel.mx_internal::applyFromXML(resultData);
		}
		
		
		/**
		 * 
		 */
		public function contentFaultHandler(event:FaultEvent):void
		{
			trace(ObjectUtil.toString(event));
		}
		
		
		[EventHandler(event="BoardEvent.GET_BOARD_LIST", properties="pageNum")]
		/**
		 * 
		 */
		public function getList(pageNum:int):void
		{
			serviceHelper.executeServiceCall(listService.send({page:pageNum}), listResultEventHandler,
				listFaultEventHandler);
		}
		
		
		/**
		 * 리스트 서비스 정상 핸들러
		 */
		public function listResultEventHandler(event:ResultEvent):void
		{
			var tmpData:XML = event.result as XML;
			boardListModel.source = tmpData.row;
			
			dispatcher.dispatchEvent(new BoardEvent(BoardEvent.GET_BOARD_LIST_COMPLETE));
		}
		
		
		/**
		 * 리스트 서비스 실패 핸들러
		 */
		public function listFaultEventHandler(event:FaultEvent):void
		{
			Alert.show("에러에러에러");
		}
		
	}
}