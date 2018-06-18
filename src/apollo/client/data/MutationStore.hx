package apollo.client.data;

import js.Error;

typedef MutationStoreValue = {
	var mutationString:String;
	var variables:{};
	var loading:Bool;
	var error:Null<Error>;
}

extern class MutationStore {
	public function getStore():Dynamic<MutationStoreValue>;
	public function get(mutationId:String):MutationStoreValue;
	public function initMutation(mutationId:String, mutationString:String, variables:Null<{}>):Void;
	public function markMutationError(mutationId:String, error:Error):Void;
	public function reset():Void;
}

