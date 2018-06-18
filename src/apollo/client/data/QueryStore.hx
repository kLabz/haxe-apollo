package apollo.client.data;

import js.Error;

import apollo.client.core.NetworkStatus;
import graphql.ASTDefs.DocumentNode;
import graphql.ExecutionResult;
import graphql.GraphQLError;

typedef QueryStoreValue = {
	var document:DocumentNode;
	var variables:{};
	@:optional var previousVariables:Null<{}>;
	var networkStatus:NetworkStatus;
	@:optional var graphQLErrors:Array<GraphQLError>;
	var metadata:Any;
}

typedef QueryInit = {
	var queryId:String;
	var document:DocumentNode;
	var storePreviousVariables:Bool;
	var variables:{};
	var isPoll:Bool;
	var isRefetch:Bool;
	var metadata:Any;
	@:optional var fetchMoreForQueryId:String;
}

extern class QueryStore {
	public function getStore():Dynamic<QueryStoreValue>;
	public function get(queriId:String):QueryStoreValue;
	public function initQuery(query:QueryInit):Void;
	public function markQueryResult(queryId:String, result:ExecutionResult, ?fetchMoreForQueryId:String):Void;
	public function markQueryError(queryId:String, error:Error, ?fetchMoreForQueryId:String):Void;
	public function markQueryResultClient(queryId:String, complete:Bool):Void;
	public function stopQuery(queryId:String):Void;
	public function reset(observableQueryIds:Array<String>):Void;
}

