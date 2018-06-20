package apollo.client.core;

typedef UpdateQueryFn = UpdateQueryFn_2<Any, OperationVariables>;
typedef UpdateQueryFn_1<TData> = UpdateQueryFn_2<TData, OperationVariables>;
typedef UpdateQueryFn_2<TData, TVariables> = TData -> {subscriptionData: {data: TData}, ?variables:TVariables} -> TData;

typedef UpdateQueryOptions<TVariables> = {
	@:optional var variables:TVariables;
}

