package apollo.client.core;

import graphql.ASTDefs.DocumentNode;

typedef QueryBaseOptions = QueryBaseOptions_1<OperationVariables>;
typedef QueryBaseOptions_1<TVariables> = {
	@:optional var variables:TVariables;
	@:optional var fetchPolicy:FetchPolicy;
	@:optional var errorPolicy:ErrorPolicy;
	@:optional var fetchResults:Bool;
}

typedef QueryOptions = QueryOptions_1<OperationVariables>;
typedef QueryOptions_1<TVariables> = {
	> QueryBaseOptions_1<TVariables>,
	var query:DocumentNode;
	@:optional var metatada:Any;
	@:optional var context:Any;
}

