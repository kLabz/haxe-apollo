package apollo.client.data;

import js.Promise;

import apollo.cache.ApolloCache;
import apollo.cache.DataProxy;
import apollo.util.Noise;
import graphql.ASTDefs.DocumentNode;
import graphql.ExecutionResult;

typedef MutationComplete = {
	var mutationId:String;
	@:optional var optimisticResponse:Any;
}

typedef MutationInit = {
	var mutationid:String;
	var document:DocumentNode;
	var variables:Any;
	var updateQueries:Dynamic<QueryWithUpdater>;
	@:optional var udpate:DataProxy->{}->Void;
}

typedef MutationResult = {
	> MutationInit,
	var result:ExecutionResult;
}

extern class DataStore<TSerialized> {
	private var cache:ApolloCache<TSerialized>;

	public function new(initialCache:ApolloCache<TSerialized>);

	public function getCache():ApolloCache<TSerialized>;

	public function markQueryResult(
		result:ExecutionResult,
		document:DocumentNode,
		variables:Any,
		fetchMoreForQueryId:Null<String>,
		ignoreErrors:Bool = false
	):Void;

	public function markSubscriptionResult(
		result:ExecutionResult,
		document:DocumentNode,
		variables:Any
	):Void;

	public function markMutationInit(mutation:MutationInit):Void;
	public function markMutationResult(mutation:MutationResult):Void;
	public function markMutationComplete(mutation:MutationComplete):Void;

	public function reset():Promise<Noise>;
}

