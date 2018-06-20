package apollo.client.core;

import haxe.Constraints.Function;
import haxe.extern.EitherType;

import apollo.cache.DataProxy;
import apollo.client.core.MutationQueryReducer;
import apollo.link.FetchResult;
import graphql.ASTDefs.DocumentNode;
import graphql.ExecutionResult;

typedef MutationBaseOptions = MutationBaseOptions_1<Dynamic<Any>>;
typedef MutationBaseOptions_1<T> = {
	@:optional var optimisticResponse:EitherType<{}, Function>;
	@:optional var updateQueries:MutationQueryReducersMap_1<T>;
	@:optional var refetchQueries:EitherType<ExecutionResult->RefetchQueryDescription, RefetchQueryDescription>;
	@:optional var update:MutationUpdaterFn_1<T>;
	@:optional var errorPolicy:ErrorPolicy;
	@:optional var variables:Any;
}

typedef MutationOptions = MutationOptions_1<Dynamic<Any>>;
typedef MutationOptions_1<T> = {
	> MutationBaseOptions_1<T>,
	var mutation:DocumentNode;
	@:optional var context:Any;
	@:optional var fetchPolicy:FetchPolicy;
}

typedef MutationUpdaterFn = MutationUpdaterFn_1<Dynamic<Any>>;
typedef MutationUpdaterFn_1<T> = DataProxy -> FetchResult_1<T> -> Void;

