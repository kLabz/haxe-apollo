package apollo.client.core;

import apollo.cache.DataProxy.DiffResult;
import apollo.client.core.ObservableQuery;
import apollo.link.Subscription;
import graphql.ASTDefs.DocumentNode;

typedef QueryInfo = {
	var listeners:Array<QueryListener>;
	var invalidated:Bool;
	var newData:Null<DiffResult<Any>>;
	var document:Null<DocumentNode>;
	var lastRequestId:Null<Int>;
	var observableQuery:Null<ObservableQuery_1<Any>>;
	var subscriptions:Array<Subscription>;
	@:optional var cancel:Void->Void;
}
