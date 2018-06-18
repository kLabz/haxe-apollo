package apollo.link;

import graphql.ExecutionResult;

typedef FetchResult = FetchResult_2<Dynamic<Any>, Dynamic<Any>>;
typedef FetchResult_1<C> = FetchResult_2<C, Dynamic<Any>>;

typedef FetchResult_2<C, E> = {
	> ExecutionResult,
	@:optional var extensions:E;
	@:optional var context:C;
}


