package apollo.client;

import apollo.cache.ApolloCache;
import apollo.link.ApolloLink;

typedef ApolloClientOptions<TCacheShape> = {
	var link:ApolloLink;
	var cache:ApolloCache<TCacheShape>;
	@:optional var ssrMode:Bool;
	@:optional var ssrForceFetchDelay:Float;
	@:optional var connectToDevTools:Bool;
	@:optional var queryDeduplication:Bool;
	@:optional var defaultOptions:DefaultOptions;
}

