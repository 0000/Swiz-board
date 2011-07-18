package com.flexstudy.board.model
{
	import mx.collections.XMLListCollection;

	[Bindable]
	/**
	 * 보드 리스트 데이터 모델
	 */
	public class BoardListModel extends XMLListCollection
	{
		/**
		 * Construct
		 */
		public function BoardListModel(source:XMLList = null)
		{
			super(source);
		}
	}
}