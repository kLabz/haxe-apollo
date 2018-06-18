package apollo.client;

import apollo.client.core.WatchQueryOptions;

typedef DefaultOptions = {
	@:optional var watchQuery:ModifiableWatchQueryOptions;
	@:optional var query:QueryBaseOptions;
	@:optional var mutate:MutationBaseOptions;
}

