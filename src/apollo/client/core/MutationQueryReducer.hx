package apollo.client.core;

import apollo.link.FetchResult;
import graphql.ASTDefs.DocumentNode;

typedef MutationQueryReducerOptions<T> = {
	var mutationResult:FetchResult_1<T>;
	@:optional var queryName:String;
	var queryVariables:Dynamic<Any>;
}

typedef MutationQueryReducer<T> = Dynamic<Any> -> MutationQueryReducerOptions<T> -> Dynamic<Any>;

typedef MutationQueryReducersMap = MutationQueryReducersMap_1<Dynamic<Any>>;
typedef MutationQueryReducersMap_1<T> = Dynamic<MutationQueryReducer<T>>;

