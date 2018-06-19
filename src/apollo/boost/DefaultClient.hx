package apollo.boost;

import js.Promise;

import apollo.cache.ApolloCache;
import apollo.cache.inmemory.CacheResolverMap;
import apollo.client.ApolloClient;
import apollo.link.Operation;
import apollo.link.http.HttpLink;
import apollo.link.state.ClientStateConfig;
import apollo.link.error.ErrorHandler;
import apollo.util.Noise;

typedef PresetConfig = {
	@:optional var request:Operation->Promise<Noise>;
	@:optional var uri:String;
	@:optional var credentials:String;
	@:optional var headers:Any;
	@:optional var fetchOptions:HttpLinkOptions;
	@:optional var clientState:ClientStateConfig;
	@:optional var onError:ErrorHandler;
	@:optional var cacheRedirects:CacheResolverMap;
	@:optional var cache:ApolloCache<Any>;
}

@:jsRequire('apollo-boost', 'default')
extern class DefaultClient<TCache> extends ApolloClient<TCache> {
	public function new(config:PresetConfig);
}

